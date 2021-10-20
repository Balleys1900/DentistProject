<template>
  <el-container>
    <el-aside class="aside-clinic">
      <el-row class="container-add" style="margin: 20px 20px 0 20px">
        <router-link :to="`/dash-board/clinic/add`" style="width: 100%">
          <el-button type="primary" icon="el-icon-circle-plus" style="width: 100%">Add</el-button>
        </router-link>
      </el-row>
      <el-row v-if="clinics.length > 0">
        <router-link
          v-for="(clinic, index) in clinics"
          :key="index"
          :to="`/dash-board/clinic/edit/${clinic._id}`"
          class="clinicName"
          active-class="active"
        >
          {{ clinic.name }}
        </router-link>
      </el-row>
    </el-aside>
    <el-main>
      <router-view v-if="clinics.length > 0" />
      <div v-else v-loading="clinics.length === 0" style="width:100%; height: 100%"></div>
    </el-main>
  </el-container>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';
export default {
  data() {
    return { clinics: [] };
  },
  methods: {
    ...mapActions({
      getAllClinics: 'clinic/getAllClinics',
    }),
  },
  computed: {
    ...mapGetters({
      listClinic: 'clinic/clinics',
    }),
  },
  watch: {
    listClinic: {
      handler(value) {
        this.clinics = value.data;
      },
    },
  },
  async created() {
    const clinicsList = await this.getAllClinics();
    this.clinics = clinicsList.data;
  },
};
</script>

<style scoped>
.aside-clinic {
  width: 20% !important;
  border-right: #000 1px solid;
  background-color: #fff;
  overflow-y: auto;
}
.clinicName {
  display: block;
  margin: 20px;
  text-decoration: none;
  color: #36cfc9;
}
.clinicName:hover,
.clinicName:active {
  color: #722ed1;
}
.clinicName.active {
  color: red;
}
</style>
