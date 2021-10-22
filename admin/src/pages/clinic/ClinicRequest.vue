<template>
  <div>
    <el-table :data="clinics" border style="width: 100%" empty-text="Empty Clinic">
      <el-table-column prop="username" label="Owner" width="120"> </el-table-column>
      <el-table-column prop="name" label="Name" width="180"> </el-table-column>
      <el-table-column prop="address" label="Address"> </el-table-column>
      <el-table-column label="Service Number" width="130" align="center">
        <template slot-scope="scope">
          {{ scope.row.services.length }}
        </template>
      </el-table-column>
      <el-table-column label="Time" width="170">
        <template slot-scope="scope">
          {{ scope.row.timeOpen }}AM - {{ scope.row.timeClose }}PM
        </template>
      </el-table-column>
      <el-table-column label="Status" width="120" align="center">
        <template slot-scope="scope">
          <el-tag type="primary" effect="dark" v-if="scope.row.status === 'approve'">{{
            scope.row.status
          }}</el-tag>
          <el-tag type="danger" effect="dark" v-else-if="scope.row.status === 'reject'">{{
            scope.row.status
          }}</el-tag>
          <el-tag type="warning" effect="dark" v-else-if="scope.row.status === 'pending'">{{
            scope.row.status
          }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="Operations">
        <template slot-scope="scope">
          <el-button type="primary" @click.native.prevent="handleDetail(scope.$index, clinics)">
            Detail
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog title="Services" :visible.sync="dialogVisible" width="60%" v-if="clinic">
      <el-alert
        title="Rejected"
        type="error"
        description="Nha khoa này đã bị từ chối"
        v-if="clinic.status === 'reject'"
        show-icon
      >
      </el-alert>
      <el-table border :data="clinic.services" empty-text="Empty Service">
        <el-table-column property="name" label="Name Service"></el-table-column>
        <el-table-column property="discount" label="Discount(%)"></el-table-column>
        <el-table-column label="Unit Price" width="200">
          <template slot-scope="scope"> 💲{{ scope.row.price }} </template>
        </el-table-column>
      </el-table>
      <div v-if="clinic.status === 'pending'">
        <el-button type="primary" style="margin-top: 10px" @click="handleApproveClinic(clinic)">
          Approve
        </el-button>

        <el-button type="danger" @click="handleRejectClinic(clinic)">
          Reject
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { updateStatus } from '@/api/clinic.js';
export default {
  props: ['clinics'],
  data() {
    return { dialogVisible: false, clinic: null };
  },
  methods: {
    handleDetail(index, rows) {
      this.dialogVisible = true;
      this.clinic = rows[index];
    },
    async handleApproveClinic(clinic) {
      this.$confirm('This clinic will be appear on application?', 'Warning', {
        confirmButtonText: 'OK',
        cancelButtonText: 'Cancel',
        type: 'warning',
      })
        .then(async () => {
          clinic.status = 'approve';
          await updateStatus(clinic);
          this.$message({
            type: 'success',
            message: 'Approve completed',
          });
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: 'Canceled',
          });
          clinic.status = 'pending';
        });
    },
    async handleRejectClinic(clinic) {
      this.$prompt('This clinic will be reject?', 'Reject', {
        confirmButtonText: 'OK',
        cancelButtonText: 'Cancel',
        inputPlaceholder: 'Please input reason to reject!',
        inputPattern: /^(?!\s*$).+/,
        inputErrorMessage: 'Invalid reason',
        type: 'warning',
      })
        .then(async val => {
          clinic.status = 'reject';
          await updateStatus(clinic);
          this.$message({
            type: 'success',
            message: 'Reject completed',
          });
          console.log(val);
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: 'Canceled',
          });
        });
    },
  },
};
</script>

<style></style>
