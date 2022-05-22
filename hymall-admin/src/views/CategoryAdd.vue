<template>
  <div>
    <h2>创建分类</h2>
    <div class="block">
      <el-cascader
        class="parent-category"
        v-model.trim="parentCategory"
        :options="opts"
        :props="{value:'id' ,label:'name',checkStrictly: true,emitPath:false }"
        clearable
        placeholder="选择父级分类"
      ></el-cascader>
      <div class="new-category">
        <el-input v-model.trim="newCategory" clearable placeholder="请输入新分类"></el-input>
      </div>
      <el-button type="success" @click="add">添加</el-button>
    </div>
  </div>
</template>

<script>
	import { getCategoriesTree, addCategory } from '../http/category';
	export default {
		name: 'Category',
		data() {
			return {
				parentCategory:'',
				newCategory:'',
				options: []
			};
		},
		async	created () {
			await	this.get();
		},
		computed: {
			opts() {
				const ccc=this.options;
				ccc.map((obj)=>{
					for (const key in obj) {
						if (key==='children') {
							if (obj.children.length==0) {
								obj.children=null;
							} else {
								obj.children.map((child)=>{
									child.children=null;
								})
								;			
							}
						}
					}
				});
				return ccc;
			},
		},
		methods: {
			async get(){
				this.options=await	getCategoriesTree();
			},
			async	add() {
				if (!this.newCategory) {
					return;
				}
				await	addCategory(this.parentCategory, this.newCategory);
				this.newCategory ='';
				this.parentCategory ='';
				await	this.get();
			}
		},
	};
</script>

<style scoped>
::v-deep .parent-category {
  width: 200px;
  margin-right: 20px;
}
::v-deep .new-category {
  display: inline-block;
  margin-right: 20px;
}
::v-deep .el-input__inner {
  width: 200px;
}
</style>