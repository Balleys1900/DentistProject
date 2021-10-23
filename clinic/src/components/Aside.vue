<template>
  <el-col :span="24" style="margin:">
    <el-menu
      :default-active="this.$router.currentRoute.path"
      class="el-menu-vertical-demo"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#ffd04b"
      :router="true"
    >
      <el-menu-item v-for="(menu, index) in menus" :key="index" :index="menu.path">
        <i :class="menu.icon"></i>
        <span>{{ menu.name }}</span>
      </el-menu-item>
    </el-menu>
  </el-col>
</template>

<script>
export default {
  data() {
    return {
      menus: [
        { name: 'Home', icon: 'el-icon-s-home', path: '/dash-board' },
        { name: 'Clinic', icon: 'el-icon-s-flag', path: '/dash-board/clinic' },
        { name: 'Booking', icon: 'el-icon-shopping-cart-2', path: '/dash-board/booking' },
        { name: 'Discount', icon: 'el-icon-discount', path: '/dash-board/discount' },
      ],
    };
  },
  created() {
    console.log(this.$router.currentRoute);
  },
};
</script>

<style></style>
