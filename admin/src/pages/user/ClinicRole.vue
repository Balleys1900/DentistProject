<template>
  <div>
    <el-table border :data="users" style="width: 100%" v-if="users" height="600px">
      <el-table-column prop="name" label="FullName" width="150"> </el-table-column>
      <el-table-column label="Clinic Name" v-if="clinics">
        <template slot-scope="scope">
          {{ renderNameClinicByOwner(scope.row.username) }}
        </template>
      </el-table-column>

      <el-table-column prop="address" label="Address" width="400"> </el-table-column>
      <el-table-column label="Status">
        <template slot-scope="scope">
          <el-tag type="primary" v-if="scope.row.isActive">
            Active
          </el-tag>
          <el-tag type="danger" v-else>
            Inactive
          </el-tag>
        </template>
      </el-table-column>

      <el-table-column label="Operations">
        <template slot-scope="scope">
          <el-button
            @click="handleInActive(scope.$index, users)"
            type="danger"
            size="medium"
            v-if="users[scope.$index].isActive"
          >
            Inactive
          </el-button>
          <el-button @click="handleActive(scope.$index, users)" type="primary" size="medium" v-else>
            Active
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { updateStatus } from '@/api/user.js';
import { getClinics } from '@/api/clinic.js';
export default {
  props: ['users'],
  data() {
    return { dialogVisible: false, clinics: null };
  },
  methods: {
    renderNameClinicByOwner(username) {
      const clinic = this.clinics.find(clinic => clinic.username === username);
      return clinic ? clinic.name : 'Not created clinic';
    },
    async handleActive(index, rows) {
      try {
        rows[index].isActive = true;
        const res = await updateStatus(rows[index]);
        if (res.status === 200) {
          this.$message({
            type: 'success',
            message: 'Active completed',
          });
        }
      } catch (e) {
        console.log(e);
        rows[index].isActive = false;
        this.$message.error(e);
      }
    },
    async handleInActive(index, rows) {
      this.$confirm('This will inactive user. Continue?', 'Warning', {
        confirmButtonText: 'OK',
        cancelButtonText: 'Cancel',
        type: 'warning',
      })
        .then(async () => {
          try {
            rows[index].isActive = false;
            const res = await updateStatus(rows[index]);
            if (res.status === 200) {
              this.$message({
                type: 'success',
                message: 'Active completed',
              });

              this.$message({
                type: 'success',
                message: 'Inactive completed',
              });
            }
          } catch (e) {
            console.log(e);
            rows[index].isActive = true;
            this.$message.error(e);
          }
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: 'Inactive canceled',
          });
        });
    },
  },
  async created() {
    const res = await getClinics();
    if (res.status === 200) {
      this.clinics = res.data.data;
    }
  },
};
</script>

<style>
.scrollbar {
  height: 600px;
}
</style>
