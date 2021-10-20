<template>
  <el-main>
    <el-table :data="users" style="width: 100%" v-if="users">
      <el-table-column prop="name" label="FullName" width="200"> </el-table-column>
      <el-table-column prop="username" label="Username" width="150"> </el-table-column>
      <el-table-column prop="role" label="Role" width="180"> </el-table-column>
      <el-table-column prop="address" label="Address" width="300"> </el-table-column>

      <el-table-column prop="avatar" label="Avatar" width="350"> </el-table-column>
      <el-table-column label="Operations" width="120">
        <template slot-scope="scope">
          <el-button @click="handleClick(scope.$index, users)" type="text" size="small"
            >Edit</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <el-dialog title="Tips" :visible.sync="dialogVisible" width="30%" :before-close="handleClose">
      <el-form>
        <el-form-item label="Address">
          <el-input></el-input>
        </el-form-item>
        <el-form-item label="Role">
          <el-input></el-input>
        </el-form-item>
        <el-form-item label="Avatar">
          <el-input></el-input>
        </el-form-item>
        <el-form-item label="Active">
          <el-switch v-model="isActive"> </el-switch>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="dialogVisible = false">Confirm</el-button>
      </span>
    </el-dialog>
  </el-main>
</template>

<script>
import { mapActions } from 'vuex';
export default {
  data() {
    return {
      users: null,
      dialogVisible: false,
      isActive: true,
    };
  },
  methods: {
    ...mapActions({
      getUsers: 'user/getUsers',
    }),
    handleClick(index, users) {
      this.dialogVisible = true;
    },
    handleClose(done) {
      this.$confirm('Are you sure to close this dialog?')
        .then(() => {
          done();
        })
        .catch(() => {});
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
