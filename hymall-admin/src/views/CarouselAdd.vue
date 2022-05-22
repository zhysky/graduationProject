<template>
  <div>
    <h1>添加轮播图</h1>
    <el-form @submit.native.prevent="save" label-width="120px" style="margin-top:1rem">
      <el-form-item label="所属分类">
        <el-cascader
          :options="opts"
          :props="{value:'id' ,label:'name',emitPath:false,expandTrigger: 'hover' }"
          @change="getGoods"
          class="category"
          clearable
          placeholder="选择父级分类"
          v-model="category.id"
        ></el-cascader>
      </el-form-item>
      <el-form-item label="商品名">
        <el-select filterable placeholder="请选择" v-model="good_id">
          <el-option :key="item.id" :label="item.name" :value="item.id" v-for="item in goods"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="图片">
        <el-upload
          :action="uploadUrl"
          :before-upload="beforeUpload"
          :headers="getAuthHeader()"
          :on-success="handleSuccess"
          :show-file-list="false"
          class="cover-uploader"
        >
          <img :src="src" class="cover" v-if="src" alt />
          <i class="el-icon-plus cover-uploader-icon" v-else></i>
        </el-upload>
      </el-form-item>
      <el-form-item style="margin-top:1rem">
        <el-button type="primary" native-type="submit">添加</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { addCarousel } from "../http/carousel";
import { getCategoriesTree, getGoodByCategory } from "../http/category";

export default {
  name: "CarouselAdd",
  data() {
    return {
      goods: [],
      good_id: "",
      src: "",
      category: {
        id: "",
      },
      options: [],
    };
  },
  computed: {
    opts() {
      const ccc = this.options;
      ccc.map((obj) => {
        for (const key in obj) {
          if (key === "children") {
            if (obj.children.length === 0) {
              obj.children = null;
            } else {
              obj.children.map((child) => {
                if (child.children.length === 0) {
                  child.children = null;
                } else {
                  child.children.map((child) => {
                    child.children = null;
                  });
                }
              });
            }
          }
        }
      });
      return ccc;
    },
    good_name() {
      const good = this.goods.filter((val, index) => {
        return val.id === this.good_id;
      });
      return good[0].name;
    },
    carouselForm() {
      return {
        good_id: this.good_id,
        good_name: this.good_name,
        src: this.src,
      };
    },
  },
  async created() {
    await this.get();
  },
  methods: {
    async get() {
      this.options = await getCategoriesTree();
    },
    async getGoods() {
      this.good = "";
      const goods = await getGoodByCategory(this.category.id);
      this.goods = goods[0];
    },
    beforeUpload(file) {
      const isPic = file.type.startsWith("image/");
      const size = 20;
      const isOverSize = file.size / 1024 / 1024 < size;

      if (!isPic) {
        this.$message.error("只能上传 图片 格式!");
      }
      if (!isOverSize) {
        this.$message.error(`上传图片大小不能超过 ${size} MB!`);
      }
      return isPic && isOverSize;
    },
    handleSuccess(res, file) {
      this.src = res.url;
    },
    async save() {
      if (!(this.carouselForm.good_id && this.carouselForm.src)) return;
      let res = await addCarousel(this.carouselForm);
      this.$router.push("/carousel/list");
      this.$message({
        type: "success",
        message: res.message,
      });
    },
  },
};
</script>

<style scoped>
.cover-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  min-width: 220px;
  height: 300px;
  line-height: 300px;
  text-align: center;
  background-color: rgba(255, 255, 255, 0.3);
}

.el-input,
.el-textarea {
  width: 300px;
}
</style>