<template>
  <div>
    <div class="search d-flex flex-column">
      <v-card width="1228px" class="flex-grow-1 d-flex flex-column good my-3 pa-0 my-1 mx-auto">
        <div class="ma-2">
          按价格排序:
          <v-tooltip right>
            <template v-slot:activator="{ on }">
              <v-btn icon v-on="on" @click="desc">
                <v-icon class="mdi-rotate-45">mdi-arrow-bottom-right</v-icon>
              </v-btn>
            </template>
            <span>降序</span>
          </v-tooltip>
          <v-tooltip right>
            <template v-slot:activator="{ on }">
              <v-btn icon v-on="on" @click="asc">
                <v-icon class="mdi-rotate-225">mdi-arrow-bottom-right</v-icon>
              </v-btn>
            </template>
            <span>升序</span>
          </v-tooltip>
        </div>
        <template v-if="!good.length">
          <div class="info--text text-center d-flex justify-center flex-column flex-grow-1">
            <h2 v-cloak>没有该商品</h2>
          </div>
        </template>
        <div v-else class="d-flex flex-wrap my-1">
          <template v-for="go in good">
            <Good :id="go.id" :title="go.name" :price="go.price" :cover="go.cover" :key="go.id" />
          </template>
        </div>
      </v-card>
      <div class="my-5 text-center">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[12,24,36]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="count"
        ></el-pagination>
      </div>
    </div>
    <MFotter />
  </div>
</template>

<script>
import { getGoodByCategory } from '../api/category';
import { getGoodDetail, getGoodByName } from '../api/good';
import Good from '@/components/Good.vue';
import MFotter from '@/components/MFotter.vue';
export default {
  name: 'Search',
  props: {
    id: String,
    goodName: String,
  },
  components: {
    Good,
    MFotter
  },
  data() {
    return {
      page: 1,
      good: [],
      currentPage: 1,
      pageSize: 24,
      count: 0
    };
  },
  computed: {
    skip() {
      return (this.currentPage - 1) * this.pageSize;
    },
    take() {
      return this.pageSize;
    }
  },
  created() {
    this.fetch();
  },
  methods: {
    async	fetch() {
      if (this.id) {
        getGoodByCategory(this.id, this.skip, this.take).then(res => {
          [this.good, this.count] = res;
        }).catch(err => err);
      }
      if (this.goodName) {
        getGoodByName(this.goodName, this.skip, this.take).then(res => {
          [this.good, this.count] = res;
        }).catch(err => err);
      }
    },
    desc() {
      this.$store.commit('order', 'DESC');
      this.fetch();
    },
    asc() {
      this.$store.commit('order', 'ASC');
      this.fetch();
    },
    async	getGoodDetail() {
      this.good = await getGoodDetail(this.goodName);
    },
    handleSizeChange(val) {
      this.pageSize = val;
      this.fetch();
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      this.fetch();
    },
  },
  watch: {
    '$route'(to, from) {
      this.fetch();
    }
  },
  beforeRouteLeave(to, from, next) {
    this.$store.commit('order', '');
    next();
  }
};
</script>

<style lang="stylus" scoped>
.search
  min-height calc(100vh - 160px)

*[v-cloak]
  display none

::v-deep .el-pager
  padding-left 0 !important
</style>