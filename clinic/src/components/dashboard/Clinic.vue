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
import { addClinic, updateClinic } from '@/api/clinic.js';
import ClinicDetail from './clinic/ClinicDetail.vue';
import ServiceClinic from './clinic/ServiceClinic.vue';
import { mapGetters } from 'vuex';
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
      clinic.status = 'pending';
      try {
        const res = await addClinic({ clinic: clinic });
        if (res.status === 201)
          this.$message({
            message: 'Add successful',
            type: 'success',
          });
      } catch (error) {
        clinic.status = 'unregistered';
        this.$message.error(error);
      }
    },
    async handleUpdateClinic(clinic) {
      try {
        const res = await updateClinic({ clinic: clinic });
        if (res.status === 200)
          this.$message({
            message: 'Update successful',
            type: 'success',
          });
      } catch (error) {
        this.$message.error(error);
      }
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
