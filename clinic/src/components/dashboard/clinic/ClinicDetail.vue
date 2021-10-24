<template>
  <el-form :model="clinic" :rules="rules" ref="ruleForm">
    <el-row>
      <el-alert
        title="Rejected"
        type="error"
        description="This dental clinic was rejected because the service information is not clear"
        v-if="clinic.status === 'reject'"
        show-icon
      >
      </el-alert>
      <el-col :span="8">
        <el-form-item label="Active Status: ">
          <el-switch v-model="clinic.isActive" active-color="#13ce66" inactive-color="#ff4949">
          </el-switch>
        </el-form-item>
      </el-col>
      <el-col :span="16">
        <el-form-item label="Request Status: ">
          <el-tooltip
            class="item"
            effect="dark"
            content="Your clinic has been approved by the Admin"
            placement="top-start"
            v-if="clinic.status === 'approve'"
          >
            <el-tag type="primary" effect="dark">{{ clinic.status }}</el-tag>
          </el-tooltip>
          <el-tooltip
            class="item"
            effect="dark"
            content="Your Clinic was Denied, because the information service is invalid!"
            placement="top-start"
            v-else-if="clinic.status === 'reject'"
          >
            <el-tag type="danger" effect="dark">{{ clinic.status }}</el-tag>
          </el-tooltip>
          <el-tooltip
            class="item"
            effect="dark"
            content="You must waiting for the Admin to approve!"
            placement="top-start"
            v-else-if="clinic.status === 'pending'"
          >
            <el-tag type="warning" effect="dark">{{ clinic.status }}</el-tag>
          </el-tooltip>
          <el-tag type="info" effect="dark" v-else>Not Created</el-tag>
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="40">
      <el-col :span="12">
        <el-form-item label="Name: " prop="name">
          <el-input v-model="clinic.name" placeholder="Input name clinic..." />
        </el-form-item>
      </el-col>
      <el-col :span="12">
        <el-form-item label="Image: " prop="image">
          <el-input v-model="clinic.image" placeholder="Input image clinic..." />
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="40">
      <el-col :span="14">
        <el-form-item label="Address: " prop="address">
          <el-input v-model="clinic.address" placeholder="Input address clinic..." />
        </el-form-item>
      </el-col>
      <el-col :span="5">
        <el-form-item label="Time Open: " prop="timeOpen">
          <el-time-select
            v-model="clinic.timeOpen"
            :picker-options="{
              start: '07:00',
              step: '01:00',
              end: '19:00',
            }"
            placeholder="Select time open"
          >
          </el-time-select>
        </el-form-item>
      </el-col>
      <el-col :span="5">
        <el-form-item label="Time Close: " prop="timeClose">
          <el-time-select
            v-model="clinic.timeClose"
            :picker-options="{
              start: '07:00',
              step: '01:00',
              end: '19:00',
            }"
            placeholder="Select time close"
          >
          </el-time-select>
        </el-form-item>
      </el-col>
    </el-row>
    <el-row :gutter="40">
      <el-col :span="24">
        <el-form-item label="Description: " prop="description">
          <el-input
            type="textarea"
            v-model="clinic.description"
            placeholder="Input description clinic..."
          />
        </el-form-item>
      </el-col>
    </el-row>
    <el-row>
      <el-col>
        <el-button type="warning" style="width: 100%" v-if="clinic.status === 'pending'" disabled>
          Pending
        </el-button>
        <el-button
          type="primary"
          style="width: 100%"
          @click="handleUpdate(clinic)"
          v-else-if="clinic.status === 'approve'"
        >
          Updated
        </el-button>
        <el-button
          type="info"
          style="width: 100%"
          @click="handleRetry(clinic)"
          v-else-if="clinic.status === 'reject'"
        >
          Retry
        </el-button>
        <el-button type="primary" style="width: 100%" @click="handleRegister(clinic)" v-else>
          Register
        </el-button>
      </el-col>
    </el-row>
  </el-form>
</template>

<script>
export default {
  props: ['clinic'],
  data() {
    return {
      rules: {
        name: [{ required: true, message: 'Please input Clinic name', trigger: 'blur' }],
        image: [{ required: true, message: 'Please input Clinic image', trigger: 'blur' }],
        address: [{ required: true, message: 'Please input Clinic address', trigger: 'blur' }],
        timeOpen: [{ required: true, message: 'Please pick a time Open', trigger: 'blur' }],
        timeClose: [{ required: true, message: 'Please pick a time Close', trigger: 'blur' }],
        description: [
          { required: true, message: 'Please input Clinic description', trigger: 'blur' },
        ],
      },
    };
  },
  methods: {
    handleRegister(clinic) {
      console.log(clinic);
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.$emit('registerClinic', clinic);
        } else {
          return false;
        }
      });
    },
    handleUpdate(clinic) {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.$emit('updateClinic', clinic);
        } else {
          return false;
        }
      });
    },
    handleRetry(clinic) {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          clinic.status = 'pending';
          this.$emit('updateClinic', clinic);
        } else {
          return false;
        }
      });
    },
  },
};
</script>

<style></style>
