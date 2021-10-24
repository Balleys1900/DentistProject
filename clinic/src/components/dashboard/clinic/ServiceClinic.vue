<template>
  <div>
    <el-button type="primary" style="margin-bottom: 20px;" @click="handleOpenDialog">
      Add New Service
    </el-button>
    <el-table :data="services" border style="width: 100%" emptyText="List of service is empty">
      <el-table-column prop="name" label="Name" width="200"> </el-table-column>
      <el-table-column prop="image" label="Image"> </el-table-column>
      <el-table-column prop="price" label="Price(💲)" width="200"> </el-table-column>
      <el-table-column prop="steps" label="Steps">
        <template #default="scope">
          <p v-for="step in scope.row.steps" :key="step">{{ step }}</p>
        </template>
      </el-table-column>
      <el-table-column label="Operations" width="150">
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
      <el-form :model="service" :rules="rules" ref="ruleForm">
        <el-form-item label="Name: " prop="name">
          <el-input v-model="service.name" placeholder="Input name service..." />
        </el-form-item>
        <el-form-item label="Image: " prop="image">
          <el-input v-model="service.image" placeholder="Input image service..." />
        </el-form-item>
        <el-form-item label="Price: " prop="price">
          <el-input type="number" v-model="service.price" />
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
    return {
      dialogVisible: false,
      service: initService,
      isAdd: false,
      rules: {
        name: [{ required: true, message: 'Please input Service name', trigger: 'blur' }],
        image: [{ required: true, message: 'Please input Service image', trigger: 'blur' }],
        price: [{ required: true, message: 'Please input Service price', trigger: 'blur' }],
      },
    };
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
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.dialogVisible = false;
          this.$emit('addNewService', service);
        } else {
          return false;
        }
      });
    },
    handleUpdateService(service) {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.dialogVisible = false;
          this.$emit('updateService', service);
        } else {
          return false;
        }
      });
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
