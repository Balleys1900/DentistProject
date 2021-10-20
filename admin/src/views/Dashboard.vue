<template>
  <el-container>
    <el-aside class="aside">
      <AsideComponent />
    </el-aside>
    <el-container class="sub-container">
      <el-header>
        <div style="font-weight: bold">{{ $route.name }}</div>
        <div>
          <el-dropdown>
            <span class="el-dropdown-link">
              <i class="el-icon-more"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item disabled style="font-weight: bold; color: #000"
                >Welcome, Tai</el-dropdown-item
              >
              <el-dropdown-item>Signout</el-dropdown-item>
              <el-dropdown-item>Profile</el-dropdown-item>
              <el-dropdown-item>Settings</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </el-header>
      <el-main>
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import { mapGetters } from 'vuex';
// @ is an alias to /src
import AsideComponent from '../components/AsideComponent.vue';
export default {
  components: { AsideComponent },
  data() {
    return { curUser: null };
  },
  computed: {
    ...mapGetters({
      user: 'user/user',
    }),
  },
  created() {
    this.curUser = this.user;
  },
  name: 'Dashboard',
};
</script>
<style>
.el-container {
  height: 100vh;
}
.el-aside {
  background-color: #545c64;
}
.aside {
  width: 15% !important;
}

.el-header {
  height: 50px !important;
  border-bottom: #545c64 1px solid;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.el-main {
  padding: 0;
  height: calc(100vh - 50px);
  overflow: hidden;
}
</style>
