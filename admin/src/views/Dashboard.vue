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
            <el-button type="text">
              Welcome, {{ this.user.name }} <i class="el-icon-caret-bottom"></i>
            </el-button>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>
                <el-button type="text" style="color: black" icon="el-icon-setting"
                  >Setting</el-button
                >
              </el-dropdown-item>
              <el-dropdown-item>
                <el-button type="text" style="color: black" icon="el-icon-user-solid"
                  >Information</el-button
                >
              </el-dropdown-item>
              <el-dropdown-item>
                <el-button
                  type="text"
                  style="color: black"
                  icon="el-icon-close"
                  @click="handleSignOut"
                  >Signout</el-button
                >
              </el-dropdown-item>
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
// @ is an alias to /src
import AsideComponent from '../components/AsideComponent.vue';
export default {
  components: { AsideComponent },
  data() {
    return { user: JSON.parse(localStorage.getItem('user')) };
  },
  methods: {
    handleSignOut() {
      localStorage.removeItem('user');
      this.$router.push({ name: 'LoginPage' });
    },
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
  height: calc(100vh - 50px);
  overflow: hidden;
}
</style>
