<template>
  <div class="form-wrapper">
    <h1 style="text-align: center; padding: 20px">Clinic</h1>
    <div class="btn-clinic" v-if="this.$route.params.id">
      <el-button type="primary" class="btn" @click="editClinic">Update</el-button>
      <el-button type="danger" class="btn" @click="removeClinic($route.params.id)"
        >Remove</el-button
      >
    </div>
    <div class="btn-clinic" v-else>
      <el-button type="primary" class="btn" @click="createNewClinic">Save</el-button>
    </div>

    <el-form label-position="top" class="container">
      <el-row :gutter="30">
        <el-col :span="12">
          <el-form-item label="Name">
            <el-input placeholder="Input Clinic Name..." v-model="clinic.name" />
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="Active">
            <el-switch v-model="clinic.isActive"> </el-switch>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-form-item label="Address">
          <el-input placeholder="Input Clinic Address..." v-model="clinic.address" />
        </el-form-item>
      </el-row>
      <el-row>
        <el-form-item label="Description">
          <el-input
            type="textarea"
            :rows="3"
            autosize
            resize="none"
            placeholder="Input Clinic Description..."
            v-model="clinic.description"
          />
        </el-form-item>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item label="Image">
            <el-input placeholder="Input image..." v-model="clinic.image"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="Time Open">
            <el-input placeholder="Input image..." v-model="clinic.timeOpen"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="Time Close">
            <el-input placeholder="Input image..." v-model="clinic.timeClose"></el-input>
          </el-form-item>
        </el-col>
      </el-row>

      <div class="service">
        <div class="header-service">
          <h3 style="text-align: center; padding: 10px">
            Danh Sách Service
          </h3>

          <el-button type="primary" class="btn-add" @click="handleAddServiceDialog"
            >Add <i class="el-icon-circle-plus-outline"></i
          ></el-button>
        </div>
        <el-table
          empty-text="This clinic does not have any services"
          :data="clinic.services"
          border
          style="width: 100%"
        >
          <el-table-column prop="name" label="Name" width="125"></el-table-column>
          <el-table-column prop="image" label="Image" width="180"></el-table-column>
          <el-table-column prop="price" label="Price" width="100"></el-table-column>
          <el-table-column prop="discount" label="Discount" width="100"> </el-table-column>
          <el-table-column prop="steps" label="Steps" width="300">
            <template #default="scope">
              <p v-for="step in scope.row.steps" :key="step">{{ step }}</p>
            </template>
          </el-table-column>
          <el-table-column fixed="right" label="Operations" width="120">
            <template slot-scope="scope">
              <el-button
                type="text"
                @click.native.prevent="handleDialog(scope.$index, clinic.services)"
                size="small"
                >Edit</el-button
              >
              <el-button
                type="text"
                size="small"
                @click.native.prevent="removeService(scope.$index, clinic.services)"
                >Remove</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </div>

      <el-dialog
        :title="`${isAdd ? 'Add New Service' : 'Update Service'}`"
        :visible.sync="dialogFormVisible"
        v-if="service"
      >
        <el-form :model="service">
          <el-form-item label="Name">
            <el-input v-model="service.name" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="Image">
            <el-input v-model="service.image" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="Price($)">
            <el-input type="number" v-model="service.price" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="Discount(%)">
            <el-input type="number" v-model="service.discount" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="Steps">
            <div v-for="(step, index) in service.steps" :key="index">
              <el-input style="margin-bottom: 8px" v-model="service.steps[index]"></el-input>
            </div>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">Cancel</el-button>
          <el-button type="primary" @click="addMoreService" v-if="isAdd"> Add </el-button>
          <el-button type="primary" @click="updateService" v-else> Update </el-button>
        </span>
      </el-dialog>
    </el-form>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';

const initService = { name: '', image: '', price: '', discount: '', steps: '' };
const initClinic = {
  name: '',
  address: '',
  description: '',
  image: '',
  timeOpen: '',
  timeClose: '',
  isActive: false,
  services: [],
};

export default {
  name: 'form-clinic',
  data() {
    return {
      dialogFormVisible: false,
      service: null,
      isAdd: false,
      clinic: { ...initClinic },
    };
  },
  methods: {
    ...mapActions({
      addClinic: 'clinic/addClinic',
      deleteClinic: 'clinic/deleteClinic',
      updateClinic: 'clinic/updateClinic',
    }),
    handleDialog(index, services) {
      this.isAdd = false;
      this.service = services[index];
      this.dialogFormVisible = true;
    },
    handleAddServiceDialog() {
      this.isAdd = true;
      this.service = { ...initService };
      this.dialogFormVisible = true;
    },
    addMoreService() {
      this.dialogFormVisible = false;
      this.clinic.services.push(this.service);
      this.service = { ...initService };
    },
    updateService() {
      this.dialogFormVisible = false;
      this.clinic.services = this.clinic.services.map(ser =>
        ser._id === this.service._id ? this.service : ser
      );
    },
    removeService(index, services) {
      services.splice(index, 1);
    },
    handleInitClinicData(id) {
      if (id) {
        this.clinic = { ...this.clinics.data.find(clinic => clinic._id === id) };
      } else {
        this.clinic = { ...initClinic };
      }
    },

    async createNewClinic() {
      const isSuccess = await this.addClinic({ ...this.clinic });
      if (isSuccess) {
        this.clinic = { ...initClinic };
        this.$message({
          type: 'success',
          message: 'Add Completed',
        });
      } else {
        this.$message.error('Add Failed');
      }
    },
    async editClinic() {
      const isUpdate = await this.updateClinic(this.clinic);
      isUpdate
        ? this.$message({
            type: 'success',
            message: 'Updated Sucessful',
          })
        : this.$message.error('Update Failed');
    },

    async removeClinic(id) {
      if (confirm('This will permanently delete the Clinic. Continue?')) {
        const isDelete = await this.deleteClinic(id);
        if (isDelete) {
          this.$router.push('/dash-board/clinic');
          this.clinic = { ...initClinic };
          this.$message({
            type: 'success',
            message: 'Delete Sucessful',
          });
        } else this.$message.error('Delete Failed');
      }
    },
  },
  computed: {
    ...mapGetters({ clinics: 'clinic/clinics' }),
  },

  watch: {
    '$route.params.id': {
      handler(value) {
        this.handleInitClinicData(value);
      },
    },
  },
  created() {
    this.handleInitClinicData(this.$route.params.id);
  },
};
</script>

<style scoped>
.form-wrapper {
  position: relative;
  height: calc(100vh - 60px);
  max-width: 100%;
  overflow-y: auto;
}
.container {
  margin: 20px;
  overflow: auto;
}
.service {
  border: 1px solid #ccd;
  padding: 10px;
}
.header-service {
  position: relative;
}
.btn-add {
  position: absolute;
  top: 0;
}
.btn-clinic {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  display: flex;
  justify-content: right;
  z-index: 1000;
}
.btn-clinic .btn {
  width: 15%;
}
</style>
