<template>
  <div>
    <my-list
      @changeSize="changeSize"
      @changeCurrent="changeCurrent"
      @edit="editGood"
      @remove="deleteGood"
      title="商品列表"
      :list="list"
      :count="count"
      :currentPage="currentPage"
      :pageSize="pageSize"
    >
      <template v-slot:default>
        <el-table-column prop="category.name" label="分类" width="180"></el-table-column>
      </template>
    </my-list>
  </div>
</template>

<script>
	import MyList from '../components/MyList.vue';
	import {  getGoodList, deleteGood } from '../http/good';

	export default {
		name: 'GoodList',
		components: {
			MyList,
		},
		data() {
			return {
				list: [],
				count:0,
				currentPage:1,
				pageSize:5
			};
		},
		computed: {
			skip() {
				return (this.currentPage-1)*this.pageSize;
			}, 
			take() {
				return this.pageSize;
			}
		},
		async	created () {
			await	this.fetch();
		},
		methods: {
			async	fetch() {
				getGoodList(this.skip, this.take).then(res=>{
					[this.list, this.count]=res;
				}).catch(err =>err);
			},
			async deleteGood(id){
				this.$confirm('确认删除该商品?', {
					confirmButtonText: '确定',
					cancelButtonText: '取消',
					type: 'warning'
				}).then(async () => {
					const res = await	deleteGood(id);
					await	this.fetch();
					this.$message({
						type: 'success',
						message: res.message
					});
				}).catch(() => {
					this.$message({
						type: 'info',
						message: '已取消删除'
					});          
				});
		
			},
			async editGood(id){
				this.$router.push(`/good/edit/${id}`);
			},
			changeSize(val){
				this.pageSize=val;
				this.fetch();
			}, 
			changeCurrent(val){
				this.currentPage=val;
				this.fetch();
			}
		},
	};
</script>

<style scoped>
</style>