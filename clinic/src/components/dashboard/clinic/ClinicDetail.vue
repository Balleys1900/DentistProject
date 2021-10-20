<template>
  <el-form :model="clinic">
    <el-row>
      <el-col :span="8">
        <el-form-item label="Active Status: ">
          <el-switch v-model="clinic.isActive" active-color="#13ce66" inactive-color="#ff4949">
          </el-switch>
        </el-form-item>
      </el-col>
      <el-col :span="16">
        <el-form-item label="Request Status: ">
          <el-tag type="primary" effect="dark">{{ clinic.status }}</el-tag>
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="40">
      <el-col :span="12">
        <el-form-item label="Name: ">
          <el-input v-model="clinic.name" />
        </el-form-item>
      </el-col>
      <el-col :span="12">
        <el-form-item label="Image: ">
          <el-input v-model="clinic.image" />
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="40">
      <el-col :span="12">
        <el-form-item label="Address: ">
          <el-input v-model="clinic.address" />
        </el-form-item>
      </el-col>
      <el-col :span="6">
        <el-form-item label="Time Open: ">
          <el-input v-model="clinic.timeOpen" />
        </el-form-item>
      </el-col>
      <el-col :span="6">
        <el-form-item label="Time Close: ">
          <el-input v-model="clinic.timeClose" />
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="40">
      <el-col :span="24">
        <el-form-item label="Description: ">
          <el-input type="textarea" v-model="clinic.description" />
        </el-form-item>
      </el-col>
    </el-row>
    <el-row>
      <el-col>
        <el-button type="primary" style="width: 100%" v-if="clinic.status === 'unregistered'">
          Register
        </el-button>
        <el-button type="primary" style="width: 100%" v-else>
          Updated
        </el-button>
      </el-col>
    </el-row>
  </el-form>
</template>

<script>
export default {
  props: ['clinic'],
};
</script>

<style></style>
