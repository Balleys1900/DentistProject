<template>
  <el-tabs type="border-card">
    <el-tab-pane>
      <span slot="label"><i class="el-icon-s-flag"></i> Clinic</span>
      <ClinicDetail :clinic="clinic" />
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
import { mapMutations } from 'vuex';
import {
  getClinic,
  updateClinicService,
  addClinicService,
  deleteClinicService,
} from '@/api/clinic.js';
const initClinic = {
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
    ...mapMutations({
      setClinic: 'SET_CLINIC',
    }),
    async handleAddNewService(newService) {
      this.clinic.services.push(newService);
      try {
        const res = await addClinicService({
          idClinic: this.clinic._id,
          service: newService,
        });
        if (res.status === 200)
          this.$message({
            message: 'Add successful',
            type: 'success',
          });
      } catch (error) {
        this.$message.error('Add Failed');
      }
    },
    async handleUpdateService(serviceInstance) {
      const index = this.clinic.services.findIndex(service => service._id === serviceInstance._id);
      this.$set(this.clinic.services, index, serviceInstance);
      try {
        const res = await updateClinicService({
          idClinic: this.clinic._id,
          service: serviceInstance,
        });
        if (res.status === 200)
          this.$message({
            message: 'Update successful',
            type: 'success',
          });
      } catch (error) {
        this.$message.error('Update Failed');
      }
    },
    async handleDeleteService(index) {
      this.$confirm('This will delete service. Continue?', {
        confirmButtonText: 'OK',
        cancelButtonText: 'Cancel',
        type: 'warning',
      })
        .then(async () => {
          const res = await deleteClinicService({
            idClinic: this.clinic._id,
            idService: this.clinic.services[index]._id,
          });
          if (res.status === 204)
            this.$message({
              type: 'success',
              message: 'Delete completed',
            });
          this.clinic.services.splice(index, 1);
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: 'Delete canceled',
          });
        });
    },
  },
  async created() {
    const user = JSON.parse(localStorage.getItem('user'));
    const res = await getClinic(user.username);
    if (res.status === 200) {
      const clinic = res.data.data;
      this.setClinic(clinic);
      this.clinic = clinic;
    }
  },
};
</script>

<style></style>
