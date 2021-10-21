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
          <el-button
            @click="handleInActive(scope.$index, users)"
            type="primary"
            size="medium"
            v-else
          >
            Active
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { getClinics } from '@/api/clinic.js';
export default {
  props: ['users'],
  data() {
    return { dialogVisible: false, user: null, clinics: null };
  },
  methods: {
    handleClick(index, rows) {
      this.user = rows[index];
    },
    renderNameClinicByOwner(username) {
      const clinic = this.clinics.find(clinic => clinic.username === username);
      return clinic ? clinic.name : 'Not created clinic';
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
