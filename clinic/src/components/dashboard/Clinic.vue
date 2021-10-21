<template>
  <el-tabs type="border-card">
    <el-tab-pane>
      <span slot="label"><i class="el-icon-s-flag"></i> Clinic</span>
      <ClinicDetail
        :clinic="clinic"
        @registerClinic="handleRegisterClinic"
        @updateClinic="handleUpdateClinic"
      />
    </el-tab-pane>
    <el-tab-pane>
      <span slot="label"><i class="el-icon-s-fold"></i> Service</span>
      <ServiceClinic
        :services="clinic.services"
        @updateService="handleUpdateService"
        @addNewService="handleAddNewService"
        @deleteService="handleDeleteService"
      />
    </el-tab-pane>
  </el-tabs>
</template>

<script>
import ClinicDetail from './clinic/ClinicDetail.vue';
import ServiceClinic from './clinic/ServiceClinic.vue';
import { mapGetters } from 'vuex';
// import { updateClinicService, addClinicService, deleteClinicService } from '@/api/clinic.js';
const initClinic = {
  username: JSON.parse(localStorage.getItem('user')).username,
  name: '',
  image: '',
  timeOpen: '',
  timeClose: '',
  description: '',
  distance: '2.2',
  rating: '4.8',
  address: '',
  isActive: false,
  status: 'unregistered',
  services: [],
};
export default {
  components: { ClinicDetail, ServiceClinic },
  data() {
    return { clinic: initClinic };
  },
  methods: {
    async handleRegisterClinic(clinic) {
      console.log(clinic);
      clinic.status = 'pending';
    },
    async handleUpdateClinic(clinic) {
      console.log(clinic);
    },

    handleAddNewService(newService) {
      this.clinic.services.push(newService);
      this.$message({
        message: 'Add successful',
        type: 'success',
      });
    },
    handleUpdateService(serviceInstance) {
      const index = this.clinic.services.findIndex(service => service._id === serviceInstance._id);
      this.$set(this.clinic.services, index, serviceInstance);
      this.$message({
        message: 'Update successful',
        type: 'success',
      });
    },
    handleDeleteService(index) {
      this.$confirm('This will delete service. Continue?', {
        confirmButtonText: 'OK',
        cancelButtonText: 'Cancel',
        type: 'warning',
      })
        .then(() => {
          this.clinic.services.splice(index, 1);
          this.$message({
            type: 'success',
            message: 'Delete completed',
          });
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: 'Delete canceled',
          });
        });
    },
  },
  computed: {
    ...mapGetters({
      getClinic: 'clinic',
    }),
  },
  mounted() {
    if (Object.keys(this.getClinic).length > 0) {
      this.clinic = this.getClinic;
    }
  },
};
</script>

<style></style>
