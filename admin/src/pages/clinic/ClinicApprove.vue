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
          <el-tag v-if="scope.row.status" type="primary">
            Active
          </el-tag>
          <el-tag v-else type="danger">
            InActive
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="Operations">
        <template slot-scope="scope">
          <el-button
            @click.native.prevent="handleDetail(scope.$index, clinics)"
            type="primary"
            size="medium"
          >
            Detail
          </el-button>
          <el-button
            @click="handleInActive(scope.$index, clinics)"
            type="danger"
            size="medium"
            v-if="clinics[scope.$index].status"
          >
            Inactive
          </el-button>
          <el-button
            @click="handleInActive(scope.$index, clinics)"
            type="primary"
            size="medium"
            v-else
          >
            Active
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog title="Services" :visible.sync="dialogVisible" width="60%" v-if="services">
      <el-table border :data="services">
        <el-table-column property="name" label="Name Service"></el-table-column>
        <el-table-column property="discount" label="Discount(%)"></el-table-column>
        <el-table-column label="Unit Price" width="200">
          <template slot-scope="scope"> 💲{{ scope.row.price }} </template>
        </el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script>
// import { modifyClinic } from '@/api/clinic.js';
export default {
  props: ['clinics'],
  data() {
    return { dialogVisible: false, services: null };
  },
  methods: {
    handleDetail(index, rows) {
      console.log(rows[index]);
      this.dialogVisible = true;
      this.services = rows[index].services;
    },
    async handleInActive(index, rows) {
      rows[index].status = false;
    },
  },
};
</script>

<style></style>
