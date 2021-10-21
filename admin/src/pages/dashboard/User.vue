<template>
  <el-tabs type="border-card">
    <el-tab-pane label="Customer">
      <CustomerRole :users="customer" />
    </el-tab-pane>
    <el-tab-pane label="Clinic Owner">
      <ClinicRole :users="clinic" />
    </el-tab-pane>
  </el-tabs>
</template>

<script>
import { mapActions } from 'vuex';
import ClinicRole from '../user/ClinicRole.vue';
import CustomerRole from '../user/CustomerRole.vue';

export default {
  components: { CustomerRole, ClinicRole },
  data() {
    return {
      customer: null,
      clinic: null,
      dialogVisible: false,
      isActive: true,
    };
  },
  methods: {
    ...mapActions({
      getUsers: 'user/getUsers',
    }),
    handleClick() {
      this.dialogVisible = true;
    },
    handleClose(done) {
      this.$confirm('Are you sure to close this dialog?')
        .then(() => {
          done();
        })
        .catch(() => {});
    },
  },

  async created() {
    const result = await this.getUsers();
    if (result) {
      // this.users = result.data;
      this.customer = result.data.filter(user => user.role === 'customer');
      this.clinic = result.data.filter(user => user.role === 'clinic');
    }
  },
};
</script>

<style scoped>
.el-main {
  width: 100%;
}
</style>
