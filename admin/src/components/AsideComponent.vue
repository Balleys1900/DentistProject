<template>
  <el-col :span="24">
    <el-menu
      :default-active="$route.matched[1].path"
      class="el-menu-vertical-demo"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#ffd04b"
      :router="true"
    >
      <el-menu-item v-for="(menu, index) in menus" :key="index" :index="menu.path">
        <i :class="menu.icon"></i>
        <span>{{ menu.text }}</span>
      </el-menu-item>
    </el-menu>
  </el-col>
</template>

<script>
export default {
  name: 'AsideComponent',
  data() {
    return {
      menus: [
        { text: 'Home', icon: 'el-icon-s-home', path: '/dash-board' },
        { text: 'Clinic', icon: 'el-icon-school', path: '/dash-board/clinic' },
        { text: 'User', icon: 'el-icon-user-solid', path: '/dash-board/user' },
        { text: 'Booking', icon: 'el-icon-shopping-cart-2', path: '/dash-board/booking' },
        { text: 'Setting', icon: 'el-icon-s-tools', path: '/dash-board/setting' },
      ],
    };
  },

  methods: {},
};
</script>

<style></style>
