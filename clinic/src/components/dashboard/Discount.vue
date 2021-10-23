<template>
  <el-tabs type="border-card">
    <el-tab-pane label="Voucher">
      <el-form v-if="voucher.clinic">
        <el-button type="primary" @click="handleOpenDialog" style="margin-bottom: 10px">
          Add new Voucher
        </el-button>
        <el-table :data="vouchers" border style="width: 100%">
          <el-table-column prop="name" label="Name"> </el-table-column>
          <el-table-column prop="discount" label="Discount(%)" width="110"> </el-table-column>
          <el-table-column label="Time" width="200">
            <template slot-scope="scope">
              <div v-if="scope.row.time.length === 10">
                <el-tag>
                  All Day
                </el-tag>
              </div>
              <div v-else>
                <el-tag v-for="time in scope.row.time" :key="time">
                  {{ time }}
                </el-tag>
              </div>
            </template>
          </el-table-column>

          <el-table-column label="Date" width="200">
            <template slot-scope="scope">
              {{ scope.row.startDate }} to {{ scope.row.expirationDate }}
            </template>
          </el-table-column>

          <el-table-column prop="description" label="Description"> </el-table-column>
          <el-table-column label="Status" width="150">
            <template slot-scope="scope">
              <el-tag
                :type="checkDateVoucher(scope.row.startDate, scope.row.expirationDate).type"
                effect="dark"
                >{{ checkDateVoucher(scope.row.startDate, scope.row.expirationDate).message }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column label="Operation" width="100">
            <template slot-scope="scope">
              <el-button type="primary" @click="handleOpenDetailVoucher(scope.$index, vouchers)"
                >Detail</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <el-alert
        title="You need to register the clinic to add the discount"
        type="error"
        show-icon
        v-else
      >
      </el-alert>
    </el-tab-pane>

    <!-- Add New -->
    <el-dialog title="Voucher" :visible.sync="dialogVisible" width="50%">
      <el-form :model="voucher" :rules="rules" ref="ruleForm">
        <el-row :gutter="30">
          <el-col :span="10">
            <el-form-item label="Name Voucher" prop="name">
              <el-input v-model="voucher.name" placeholder="Input name voucher..." />
            </el-form-item>
          </el-col>
          <el-col :span="14">
            <el-form-item label="Description" prop="description">
              <el-input v-model="voucher.description" placeholder="Input description voucher..." />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="30">
          <el-col :span="6">
            <el-form-item label="Discount(%)" prop="discount">
              <el-input v-model.number="voucher.discount" placeholder="%" />
            </el-form-item>
          </el-col>

          <el-col :span="7">
            <el-form-item label="Start Date" prop="startDate">
              <el-date-picker
                v-model="voucher.startDate"
                type="date"
                format="dd/MM/yyyy"
                placeholder="Pick a day start"
                :picker-options="pickerOptions"
              >
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="7">
            <el-form-item label="Expiration Date" prop="expirationDate">
              <el-date-picker
                v-model="voucher.expirationDate"
                type="date"
                format="dd/MM/yyyy"
                placeholder="Pick a day expiration"
                :picker-options="pickerOptions"
              >
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>

        <el-form-item label="Time: " prop="time">
          <el-radio-group v-model="isAllDay" @change="changeSelectedTime(isAllDay)">
            <el-radio label="1">
              All Times
            </el-radio>
            <el-radio label="2">Selected Times</el-radio>
          </el-radio-group>
          <div v-if="isAllDay === '2'">
            <el-tag
              :key="index"
              v-for="(time, index) in voucher.time"
              closable
              :disable-transitions="true"
              @close="handleClose(time)"
            >
              {{ time }}
            </el-tag>
            <el-time-select
              class="select-new-tag"
              v-model="inputValue"
              v-if="inputVisible"
              ref="saveTagInput"
              @change="handleInputConfirm"
              :picker-options="{
                start: '07:00',
                step: '01:00',
                end: '19:00',
              }"
              placeholder="Select time"
            >
            </el-time-select>
            <el-button v-else class="button-new-tag" size="small" @click="showInput"
              >+ New Tag</el-button
            >
          </div>
          <el-alert v-else title="Apply from 7:00 AM to 17:00 PM" type="success" show-icon>
          </el-alert>
        </el-form-item>

        <el-form-item label="IsActive: ">
          <el-switch v-model="voucher.isActive" active-color="#13ce66" inactive-color="#ff4949">
          </el-switch>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="addNewVoucher(voucher)">Confirm</el-button>
      </span>
    </el-dialog>

    <!-- Detail -->
    <el-dialog title="Detail" :visible.sync="dialogVisibleDetail" width="50%">
      <el-form :model="voucher">
        <el-row :gutter="30">
          <el-col :span="10">
            <el-form-item label="Name Voucher">
              <el-input v-model="voucher.name" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="14">
            <el-form-item label="Description">
              <el-input v-model="voucher.description" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="30">
          <el-col :span="6">
            <el-form-item label="Discount">
              <el-input v-model="voucher.discount" type="number" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="7">
            <el-form-item label="Start Date">
              <el-input v-model="voucher.startDate" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="7">
            <el-form-item label="Expiration Date">
              <el-input v-model="voucher.expirationDate" readonly />
            </el-form-item>
          </el-col>
        </el-row>

        <el-form-item label="Time: ">
          <el-radio-group v-model="isAllDay">
            <el-radio label="1" disabled>
              All Times
            </el-radio>
            <el-radio label="2" disabled>Selected Times</el-radio>
          </el-radio-group>
          <div v-if="isAllDay === '2'">
            <el-tag :key="time" v-for="time in voucher.time" :disable-transitions="true">
              {{ time }}
            </el-tag>
          </div>
          <el-alert v-else title="Apply from 7:00 AM to 17:00 PM" type="success" show-icon>
          </el-alert>
        </el-form-item>

        <el-form-item label="IsActive: ">
          <el-switch
            v-model="voucher.isActive"
            active-color="#13ce66"
            inactive-color="#ff4949"
            readonly
          >
          </el-switch>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisibleDetail = false">Cancel</el-button>
        <el-button type="primary" @click="updateStatusVoucher(voucher)">Inactive</el-button>
      </span>
    </el-dialog>
  </el-tabs>
</template>

<script>
import { getAllVoucherByClinicID, createNewVoucher } from '@/api/voucher.js';
import { mapGetters } from 'vuex';
const timeOption = [
  '07:00',
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
];
const initVoucher = {
  name: '',
  clinic: '',
  discount: '',
  time: [],
  description: '',
  startDate: null,
  expirationDate: null,
  isActive: false,
};

export default {
  data() {
    const validateStartDate = (rule, value, callback) => {
      if (!value) {
        callback(new Error('Please pick a start date'));
      } else {
        callback();
      }
    };
    const validateExpirationDate = (_, value, callback) => {
      if (!value) {
        callback(new Error('Please pick a expiration date'));
      } else if (this.voucher.startDate && value.getTime() <= this.voucher.startDate.getTime()) {
        callback(new Error('Must be greater than start date'));
      } else {
        callback();
      }
    };

    return {
      voucher: JSON.parse(JSON.stringify(initVoucher)),
      dialogVisible: false,
      vouchers: [],

      dynamicTags: [],
      inputVisible: false,
      inputValue: '',
      isAllDay: '2',

      dialogVisibleDetail: false,

      rules: {
        name: [{ required: true, message: 'Please input discount name', trigger: 'blur' }],
        description: [
          { required: true, message: 'Please input discount description', trigger: 'blur' },
        ],
        discount: [
          { required: true, message: 'Please input discount', trigger: 'blur' },
          {
            type: 'number',
            message: 'discount from 0 to 100 (%)',
            min: 0,
            max: 100,
            trigger: 'blur',
          },
        ],
        startDate: [
          { required: true, type: 'date', validator: validateStartDate, trigger: 'change' },
        ],
        expirationDate: [
          { required: true, type: 'date', validator: validateExpirationDate, trigger: 'change' },
        ],
        time: [
          {
            type: 'array',
            required: true,
            message: 'Please select at least one time',
            trigger: 'blur',
          },
        ],
      },
      pickerOptions: {
        disabledDate(time) {
          return Date.now() > time.getTime();
        },
      },
    };
  },
  computed: {
    ...mapGetters({
      getClinic: 'clinic',
    }),
  },
  methods: {
    handleOpenDialog() {
      this.dialogVisible = true;
      this.refreshForm();
    },
    refreshForm() {
      this.voucher = JSON.parse(JSON.stringify(initVoucher));
      this.dynamicTags = [];
      this.inputVisible = false;
      this.inputValue = '';
      this.isAllDay = '2';
    },
    // Tag time
    handleClose(tag) {
      this.voucher.time.splice(this.voucher.time.indexOf(tag), 1);
    },
    showInput() {
      this.inputVisible = true;
      this.$nextTick(() => this.$refs.saveTagInput.focus());
    },
    handleInputConfirm() {
      let inputValue = this.inputValue;
      if (inputValue) {
        if (this.voucher.time.indexOf(inputValue) < 0) this.voucher.time.push(inputValue);
        else
          this.$message({
            type: 'warning',
            message: 'You have already choose this time',
          });
      }
      this.inputVisible = false;
      this.inputValue = '';
    },

    //
    async addNewVoucher(voucher) {
      this.$refs.ruleForm.validate(async valid => {
        if (valid) {
          try {
            this.dialogVisible = false;
            const voucherAdd = {
              ...voucher,
              startDate: this.convertDate(voucher.startDate),
              expirationDate: this.convertDate(voucher.expirationDate),
            };
            this.vouchers.push(voucherAdd);
            const res = await createNewVoucher(voucherAdd);
            if (res.status === 201) {
              this.$message({
                type: 'success',
                message: 'Add Voucher Successful',
              });
            }
          } catch (error) {
            this.$message.error('Add Failed');
          }
        } else {
          return false;
        }
      });
    },

    changeSelectedTime(value) {
      if (value === '1') {
        console.log(value);
        this.voucher.time = timeOption;
      } else {
        this.voucher.time = [];
      }
    },
    convertDate(value) {
      const date = value
        .toLocaleString('en-GB', {
          day: 'numeric', // numeric, 2-digit
          year: 'numeric', // numeric, 2-digit
          month: 'numeric', // numeric, 2-digit, long, short, narrow
        })
        .replace(/\//g, '-');
      return date;
    },
    updateStatusVoucher() {
      this.dialogVisibleDetail = false;
    },
    handleOpenDetailVoucher(index, rows) {
      this.dialogVisibleDetail = true;
      this.isAllDay = rows[index].time.length === 10 ? '1' : '2';
      this.voucher = rows[index];
    },

    checkDateVoucher(startDate, endDate) {
      const today = new Date();
      const startParse = startDate.split('-');
      const endParse = endDate.split('-');
      const start = new Date(+startParse[2], startParse[1] - 1, startParse[0]);
      const end = new Date(+endParse[2], endParse[1] - 1, endParse[0]);
      if (start.getTime() > today.getTime()) {
        return { type: 'success', message: 'not started yet' };
      } else if (end.getTime() > today.getTime()) {
        return { type: 'primary', message: 'is starting' };
      } else {
        return { type: 'danger', message: 'finished' };
      }
    },
  },
  async created() {
    if (Object.keys(this.getClinic).length > 0) {
      initVoucher.clinic = this.getClinic._id;
      this.voucher.clinic = this.getClinic._id;
      const res = await getAllVoucherByClinicID(this.voucher.clinic);
      if (res.data.data.length > 0) this.vouchers = res.data.data;
    }
  },
};
</script>

<style scoped>
.el-tag + .el-tag {
  margin-left: 10px;
}
.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}
.select-new-tag {
  width: 150px;
  margin-left: 10px;
  vertical-align: bottom;
}
</style>
