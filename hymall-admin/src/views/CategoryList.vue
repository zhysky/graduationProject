<template>
  <div>
    <my-list
      @changeSize="changeSize"
      @changeCurrent="changeCurrent"
      @remove="deleteCategory"
      title="分类列表"
      :list="list"
      :edit="false"
      :count="count"
      :currentPage="currentPage"
      :pageSize="pageSize"
    >
      <template v-slot:default>
        <el-table-column prop="parent.name" label="父类" width="180"></el-table-column>
      </template>
    </my-list>
  </div>
</template>

<script>
import MyList from "../components/MyList.vue";
import { getCategoriesList, deleteCategory } from "../http/category";

export default {
  name: "CategoryList",
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
      getCategoriesList(this.skip, this.take)
        .then((res) => {
          [this.list, this.count] = res;
        })
        .catch((err) => err);
    },
    async deleteCategory(id) {
      this.$confirm("确认删除该分类?", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(async () => {
          const { code, message } = await deleteCategory(id);
          code === 0
            ? this.$message.error(message)
            : this.$message({
                type: "success",
                message: message,
              });
          await this.fetch();
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
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
</style>