<template>
  <el-table :data="bookings" border style="width: 100%">
    <el-table-column prop="user" label="Name" width="150">
      <template #default="scope">
        <p>{{ scope.row.user.name }}</p>
      </template>
    </el-table-column>
    <el-table-column prop="clinic" label="Clinic Name" width="180">
      <template #default="scope">
        <p>{{ scope.row.clinic.name }}</p>
      </template>
    </el-table-column>
    <el-table-column prop="dateAppointment" label="Date" width="120"> </el-table-column>
    <el-table-column prop="timeAppointment" label="Time" width="100"> </el-table-column>
    <el-table-column prop="clinic" label="Address" width="360">
      <template #default="scope">
        <p>{{ scope.row.clinic.address }}</p>
      </template>
    </el-table-column>
    <el-table-column prop="services" label="Amount">
      <template #default="scope">
        <p>{{ `\$${scope.row.services.reduce((acc, val) => acc + val.price, 0)}` }}</p>
      </template>
    </el-table-column>
    <el-table-column prop="status" label="Status">
      <template #default="scope">
        <el-tag type="primary" effect="dark" v-if="scope.row.status" disable-transitions>
          Success</el-tag
        >
        <el-tag type="danger" effect="dark" v-else disable-transitions>Cancel</el-tag>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
import { mapActions } from 'vuex';
export default {
  data() {
    return {
      bookings: null,
    };
  },
  methods: {
    ...mapActions({
      getBookings: 'booking/getBookings',
    }),
  },
  async created() {
    const orders = await this.getBookings();
    this.bookings = orders.data;
  },
};
</script>
