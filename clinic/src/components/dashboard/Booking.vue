<template>
  <div>
    <el-table :data="bookings" border style="width: 100%" empty-text="Booking Empty">
      <el-table-column label="Full Name" width="180">
        <template slot-scope="scope">
          {{ scope.row.user.name }}
        </template>
      </el-table-column>
      <el-table-column label="User name" width="180">
        <template slot-scope="scope">
          {{ scope.row.user.username }}
        </template>
      </el-table-column>

      <el-table-column label="Date Appointment" width="200">
        <template slot-scope="scope">
          {{ scope.row.dateAppointment }} - {{ scope.row.timeAppointment }}
        </template>
      </el-table-column>
      <el-table-column label="Total Price" width="120">
        <template slot-scope="scope">
          {{
            `💲${(
              scope.row.services.reduce(
                (acc, service) => acc + service.price * service.quantity,
                0
              ) *
              (1 - scope.row.vouchers.reduce((acc, voucher) => acc + voucher.discount, 0) / 100)
            ).toFixed(0)}`
          }}
        </template>
      </el-table-column>
      <el-table-column label="Status">
        <template slot-scope="scope">
          <el-tooltip
            class="item"
            effect="dark"
            :content="scope.row.status ? scope.row.message : scope.row.message"
            placement="top-start"
          >
            <el-tag v-if="scope.row.status" type="primary" effect="dark">
              SUCCESS
            </el-tag>
            <el-tag v-else type="danger" effect="dark">
              CANCEL
            </el-tag>
          </el-tooltip>
        </template>
      </el-table-column>
      <el-table-column label="Voucher">
        <template slot-scope="scope" v-if="scope.row.vouchers.length > 0">
          <el-tooltip
            v-for="(voucher, index) in scope.row.vouchers"
            :key="index"
            class="item"
            effect="dark"
            :content="voucher.description"
            placement="top-start"
          >
            <el-tag type="success" effect="dark" style="margin-bottom: 5px">
              {{ voucher.name }}
            </el-tag>
          </el-tooltip>
        </template>
        <template>
          <el-tag effect="dark" style="margin-bottom: 5px">
            No promotions apply
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="Operations">
        <template slot-scope="scope">
          <el-button
            @click.native.prevent="handleClick(scope.$index, bookings)"
            type="primary"
            size="medium"
            >Detail</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <el-dialog title="Details" :visible.sync="dialogVisible" width="60%" v-if="booking">
      <el-table border :data="booking.services">
        <el-table-column property="name" label="Name Service"></el-table-column>
        <el-table-column property="image" label="Imgae Service" width="350"></el-table-column>
        <el-table-column label="Unit Price">
          <template slot-scope="scope"> 💲{{ scope.row.price }} </template>
        </el-table-column>
        <el-table-column property="quantity" label="Quantity"></el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script>
import { getAllBookingByClinicID } from '../../api/booking';
import { mapGetters } from 'vuex';
export default {
  data() {
    return {
      bookings: null,
      booking: null,
      dialogVisible: false,
    };
  },
  methods: {
    handleClick(index, rows) {
      this.dialogVisible = true;
      this.booking = rows[index];
    },
  },
  computed: {
    ...mapGetters({
      clinic: 'clinic',
    }),
  },
  async created() {
    const res = await getAllBookingByClinicID(this.clinic._id);
    if (res.status === 200) {
      this.bookings = res.data.data;
    }
  },
};
</script>

<style></style>
