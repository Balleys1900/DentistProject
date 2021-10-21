<template>
  <el-container>
    <el-form class="form-container" :model="user">
      <h3 style="text-align: center;">Login</h3>
      <el-form-item label="Username:">
        <el-input placeholder="Input your account..." v-model="user.name" />
      </el-form-item>
      <el-form-item label="Password:">
        <el-input type="password" placeholder="Input your password" v-model="user.password" />
      </el-form-item>
      <el-button class="btn-login" type="primary" @click="CheckLogin">Login</el-button>
    </el-form>
  </el-container>
</template>

<script>
import { mapActions } from 'vuex';
export default {
  data() {
    return { user: { name: '', password: '' } };
  },
  methods: {
    ...mapActions({
      CheckLoginAdmin: 'user/checkLogin',
    }),
    async CheckLogin() {
      const isLogin = await this.CheckLoginAdmin(this.user);
      if (isLogin) {
        this.$message({
          message: 'Congrats, Login Successful.',
          type: 'success',
        });

        this.$router.push({ path: '/dash-board' });
      } else this.$message.error('Login Failed, Incorrect username or password');
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
.form-container .btn-login {
  width: 100%;
}
</style>
