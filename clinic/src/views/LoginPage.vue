<template>
  <el-container>
    <el-form class="form-container" :model="user">
      <h3 style="text-align: center;">Login</h3>
      <el-form-item label="Username:">
        <el-input placeholder="Input your account..." v-model="user.username" />
      </el-form-item>
      <el-form-item label="FullName:" v-if="!isLogin">
        <el-input placeholder="Input your account..." v-model="user.name" />
      </el-form-item>
      <el-form-item label="Password:">
        <el-input type="password" placeholder="Input your password" v-model="user.password" />
      </el-form-item>
      <el-form-item label="Address:" v-if="!isLogin">
        <el-input placeholder="Input your password" v-model="user.address" />
      </el-form-item>
      <div v-if="isLogin">
        <el-button class="btn" type="primary" @click="checkLogin(user)">Login</el-button>
        <el-button class="btn" type="primary" @click="handleSwich">Register</el-button>
      </div>
      <div v-else>
        <el-button class="btn" type="primary" @click="handleSwich">Login</el-button>
        <el-button class="btn" type="primary" @click="registerAccount(user)">Register</el-button>
      </div>
    </el-form>
  </el-container>
</template>

<script>
import request from '@/utils/request';
const initRegister = {
  username: '',
  name: '',
  password: '',
  address: '',
};
const initLogin = { username: '', password: '' };
export default {
  data() {
    return {
      user: initLogin,
      isLogin: true,
    };
  },
  methods: {
    handleSwich() {
      this.isLogin = !this.isLogin;
      this.isLogin ? (this.user = initLogin) : (this.user = initRegister);
    },
    async checkLogin(user) {
      try {
        const res = await request({
          url: '/users/loginClinic',
          method: 'POST',
          data: user,
        });
        if (res.status === 200) {
          this.$message({
            message: 'Congrats, Login Successful.',
            type: 'success',
          });
          localStorage.setItem('user', JSON.stringify(res.data.data));
          this.$router.push({ path: '/dash-board' });
        }
      } catch (error) {
        this.$message.error('Login Failed, Incorrect username or password');
      }
    },

    async registerAccount(user) {
      try {
        const res = await request({
          url: '/users/register',
          method: 'POST',
          data: { ...user, role: 'clinic', isActive: true },
        });
        if (res.status === 201) {
          this.$message({
            message: 'Congrats, Register Successful.',
            type: 'success',
          });
          this.isLogin = true;
          this.user = { username: user.username, password: '' };
        }
      } catch (error) {
        this.$message.error('Register Failed, username is exist');
      }
    },
  },
};
</script>

<style scoped>
.el-container {
  height: 100vh;
  justify-content: center;
  align-items: center;
  background-color: #85ffbd;
  background-image: linear-gradient(45deg, #85ffbd 0%, #fffb7d 100%);
}
.form-container {
  width: 30%;
}
.form-container .btn {
  width: 100%;
  margin: 5px 0 !important;
}
</style>
