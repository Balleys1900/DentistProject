<template>
  <el-tabs type="border-card">
    <el-tab-pane>
      <span slot="label"><i class="el-icon-success"></i> Approved</span>
      <ClinicApprove :clinics="clinicsApprove" />
    </el-tab-pane>
    <el-tab-pane>
      <span slot="label"><i class="el-icon-info"></i> Request</span>
      <ClinicRequest :clinics="clinicsRequest" />
    </el-tab-pane>
  </el-tabs>
</template>

<script>
import { getClinics } from '@/api/clinic.js';
import ClinicApprove from '../clinic/ClinicApprove.vue';
import ClinicRequest from '../clinic/ClinicRequest.vue';
export default {
  components: { ClinicApprove, ClinicRequest },
  data() {
    return { clinicsApprove: null, clinicsRequest: null };
  },
  methods: {
    handleDetail(index, rows) {
      console.log(rows[index]);
    },
  },
  async created() {
    const res = await getClinics();
    if (res.status === 200) {
      const clinics = res.data.data;
      this.clinicsApprove = clinics.filter(clinic => clinic.status === 'approve');
      this.clinicsRequest = clinics.filter(clinic => clinic.status !== 'approve');
    }
  },
};
</script>

<style scoped></style>
