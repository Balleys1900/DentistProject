<template>
  <el-container v-if="clinic">
    <el-aside>
      <Aside />
    </el-aside>
    <el-container>
      <el-header>
        <p>{{ this.$router.currentRoute.name }}</p>

        <el-dropdown>
          <el-button type="text">
            Welcome, {{ this.user.name }} <i class="el-icon-caret-bottom"></i>
          </el-button>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>
              <el-button type="text" style="color: black" icon="el-icon-setting">Setting</el-button>
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
      </el-header>
      <el-main>
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import Aside from '../components/Aside.vue';
import { mapMutations, mapGetters } from 'vuex';
import { getClinic } from '@/api/clinic.js';
export default {
  components: { Aside },
  data() {
    return { user: JSON.parse(localStorage.getItem('user')) };
  },
  computed: {
    ...mapGetters({
      clinic: 'clinic',
    }),
  },
  methods: {
    ...mapMutations({
      setClinic: 'SET_CLINIC',
    }),
    handleSignOut() {
      localStorage.removeItem('user');
      this.$router.push({ name: 'LoginPage' });
    },
  },
  async created() {
    const user = JSON.parse(localStorage.getItem('user'));
    try {
      const res = await getClinic(user.username);
      const clinic = res.data.data;
      this.setClinic(clinic);
    } catch (error) {
      this.setClinic([]);
    }
  },
};
</script>

<style>
.el-container {
  height: 100vh;
}
.el-header {
  background-color: #eef;
  display: flex;
  align-items: center;
  justify-content: space-between;
  color: #333;
  height: 50px;
}

.el-aside {
  background-color: #545c64;
  width: 15% !important;
}

.el-main {
  height: calc(100vh - 50px);
  background-color: #fff;
  color: #333;
}
</style>
