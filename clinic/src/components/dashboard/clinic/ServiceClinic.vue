<template>
  <div>
    <el-button type="primary" style="margin-bottom: 20px;" @click="handleOpenDialog">
      Add New Service
    </el-button>
    <el-table :data="services" border style="width: 100%" emptyText="Danh sách dịch vụ trống">
      <el-table-column prop="name" label="Name" width="180"> </el-table-column>
      <el-table-column prop="image" label="Image" width="350"> </el-table-column>
      <el-table-column prop="price" label="Price" width="120"> </el-table-column>
      <el-table-column prop="discount" label="Discount" width="120"> </el-table-column>
      <el-table-column prop="steps" label="Steps">
        <template #default="scope">
          <p v-for="step in scope.row.steps" :key="step">{{ step }}</p>
        </template>
      </el-table-column>
      <el-table-column label="Operations" width="200">
        <template slot-scope="scope">
          <el-button
            @click.native.prevent="handleClick(scope.$index, services)"
            type="primary"
            size="medium"
            >Edit</el-button
          >
          <!-- <el-button type="danger" size="medium" @click.native.prevent="handleDelete(scope.$index)"
            >Delete</el-button
          > -->
        </template>
      </el-table-column>
    </el-table>
    <el-dialog :title="isAdd ? 'Add' : 'Edit'" :visible.sync="dialogVisible" width="30%">
      <el-form :model="service">
        <el-form-item label="Name: ">
          <el-input v-model="service.name" />
        </el-form-item>
        <el-form-item label="Image: ">
          <el-input v-model="service.image" />
        </el-form-item>
        <el-form-item label="Price: ">
          <el-input type="number" v-model="service.price" />
        </el-form-item>
        <el-form-item label="Discount: ">
          <el-input type="number" v-model="service.discount" />
        </el-form-item>
        <el-form-item label="Steps: ">
          <el-input
            v-for="(step, index) in service.steps"
            :key="index"
            v-model="service.steps[index]"
            style="margin: 10px; width: 95%"
          >
            <el-button
              slot="append"
              icon="el-icon-delete-solid"
              style="color:red;"
              @click="deleteStep(index, service.steps)"
            ></el-button>
          </el-input>
          <el-button
            class="el-icon-circle-plus"
            size="medium"
            type="primary"
            @click="addNewSteps(service.steps)"
          ></el-button>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>

        <el-button type="primary" @click="handleAddNewService(service)" v-if="isAdd">Add</el-button>
        <el-button type="primary" @click="handleUpdateService(service)" v-else>Update</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
const initService = { name: '', image: '', discount: '', steps: [] };
export default {
  props: ['services'],
  data() {
    return { dialogVisible: false, service: initService, isAdd: false };
  },

  methods: {
    handleClick(index, rows) {
      this.dialogVisible = true;
      this.isAdd = false;
      this.service = JSON.parse(JSON.stringify(rows[index])); // gan lai cai object
    },
    handleDelete(index) {
      this.$emit('deleteService', index);
    },
    handleOpenDialog() {
      this.dialogVisible = true;
      this.isAdd = true;
      this.service = initService;
    },
    handleAddNewService(service) {
      this.dialogVisible = false;
      this.$emit('addNewService', service);
    },
    handleUpdateService(service) {
      this.dialogVisible = false;
      this.$emit('updateService', service);
    },
    deleteStep(index, steps) {
      steps.splice(index, 1);
    },
    addNewSteps(steps) {
      steps.push('');
    },
  },
};
</script>
