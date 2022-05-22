<template>
  <div>
    <my-list
      :count="count"
      :currentPage="currentPage"
      :list="list"
      :pageSize="pageSize"
      :edit="false"
      @changeCurrent="changeCurrent"
      @changeSize="changeSize"
      @remove="deleteCarousel"
      title="轮播图列表"
    >
      <template v-slot:default>
        <el-table-column label="商品名" prop="good_name" width="180"></el-table-column>
      </template>
      <template v-slot:name>
        <el-table-column label="图片" prop="src" min-width="450">
          <template slot-scope="scope">
            <el-image fit :src="scope.row.src" alt></el-image>
          </template>
        </el-table-column>
      </template>
    </my-list>
  </div>
</template>

<script>
import MyList from '../components/MyList.vue';
import { delCarousel, getCarouselList } from '../http/carousel';

export default {
  name: 'CarouselList',
  components: {
    MyList,
  },
  data() {
    return {
      list: [],
      count: 0,
      currentPage: 1,
      pageSize: 5,
    };
  },
  computed: {
    skip() {
      return (this.currentPage - 1) * this.pageSize;
    },
    take() {
      return this.pageSize;
    },
  },
  async created() {
    await this.fetch();
  },
  methods: {
    async fetch() {
      getCarouselList(this.skip, this.take).then(res => {
        [this.list, this.count] = res;
      }).catch(err => err);
    },
    async deleteCarousel(id) {
      this.$confirm('确认删除?', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }).then(async () => {
        const { code, message } = await delCarousel(id);
        code === 0
          ? this.$message.error(message)
          : this.$message({
            type: 'success',
            message: message,
          });
        await this.fetch();
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除',
        });
      });
    },
    changeSize(val) {
      this.pageSize = val;
      this.fetch();
    },
    changeCurrent(val) {
      this.currentPage = val;
      this.fetch();
    },
  },
};
</script>

<style scoped>
.el-image {
  height: 200px;
  max-width: 400px;
}
</style>