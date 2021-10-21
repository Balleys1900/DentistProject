<template>
  <el-table :data="clinics" border style="width: 100%" empty-text="There are no requests">
    <el-table-column prop="username" label="Owner" width="180"> </el-table-column>
    <el-table-column prop="name" label="Name" width="180"> </el-table-column>
    <el-table-column prop="address" label="Address"> </el-table-column>
    <el-table-column label="Time" width="170">
      <template slot-scope="scope">
        {{ scope.row.timeOpen }}AM - {{ scope.row.timeClose }}PM
      </template>
    </el-table-column>
    <el-table-column label="Status" width="120">
      <template slot-scope="scope">
        <el-tag v-if="scope.row.status" type="primary" effect="dark">
          Active
        </el-tag>
        <el-tag v-else type="danger" effect="dark">
          InActive
        </el-tag>
      </template>
    </el-table-column>
    <el-table-column label="Operations">
      <template slot-scope="scope">
        <el-button
          @click.native.prevent="handleDetail(scope.$index, clinics)"
          type="primary"
          size="small"
        >
          Detail
        </el-button>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
export default {
  props: ['clinics'],
  methods: {
    handleDetail(index, rows) {
      console.log(rows[index]);
    },
  },
};
</script>

<style></style>
