<template>
  <el-main>
    <el-table :data="users" style="width: 100%" v-if="users">
      <el-table-column prop="name" label="FullName" width="200"> </el-table-column>
      <el-table-column prop="username" label="Username" width="120"> </el-table-column>
      <el-table-column prop="role" label="Role" width="150"> </el-table-column>
      <el-table-column prop="address" label="Address" width="300"> </el-table-column>

      <el-table-column prop="avatar" label="Avatar" width="350"> </el-table-column>
      <el-table-column label="Operations" width="120">
        <template slot-scope="scope">
          <el-button @click="handleClick(scope.$index, users)" type="text" size="small"
            >Detail</el-button
          >
          <el-button type="text" size="small">Edit</el-button>
        </template>
      </el-table-column>
    </el-table>
  </el-main>
</template>

<script>
import { mapActions } from 'vuex';
export default {
  data() {
    return {
      users: null,
    };
  },
  methods: {
    ...mapActions({
      getUsers: 'user/getUsers',
    }),
    handleClick(index, users) {
      console.log(users[index]);
    },
  },

  async created() {
    const result = await this.getUsers();
    if (result) {
      this.users = result.data;
    }
  },
};
</script>

<style scoped>
.el-main {
  width: 100%;
}
</style>
