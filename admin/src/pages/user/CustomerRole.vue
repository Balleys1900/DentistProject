<template>
  <div>
    <el-table border :data="users" style="width: 100%" v-if="users" height="600px">
      <el-table-column prop="name" label="FullName" width="150"> </el-table-column>
      <el-table-column prop="username" label="Username" width="150"> </el-table-column>

      <el-table-column prop="address" label="Address" width="350"> </el-table-column>
      <el-table-column label="Status">
        <template slot-scope="scope">
          <el-tag type="primary" v-if="scope.row.isActive">
            Active
          </el-tag>
          <el-tag type="danger" v-else>
            Inactive
          </el-tag>
        </template>
      </el-table-column>

      <el-table-column label="Operations">
        <template slot-scope="scope">
          <el-button
            @click="handleInActive(scope.$index, users)"
            type="danger"
            size="medium"
            v-if="users[scope.$index].isActive"
          >
            Inactive
          </el-button>
          <el-button
            @click="handleInActive(scope.$index, users)"
            type="primary"
            size="medium"
            v-else
          >
            Active
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  props: ['users'],
  data() {
    return { dialogVisible: false, user: null };
  },
  methods: {
    handleClick(index, rows) {
      this.user = rows[index];
    },
  },
};
</script>

<style>
.scrollbar {
  height: 600px;
}
</style>
