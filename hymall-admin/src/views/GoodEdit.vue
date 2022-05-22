<template>
  <div>
    <h1>编辑商品</h1>
    <el-form label-width="120px" style="margin-top:1rem" @submit.native.prevent="update">
      <el-tabs type="border-card" value>
        <el-tab-pane label="基础信息">
          <el-form-item label="所属分类">
            <el-cascader
              class="category"
              :options="opts"
              v-model="category.id"
              :props="{value:'id' ,label:'name',checkStrictly: true,emitPath:false }"
              clearable
              placeholder="选择父级分类"
            ></el-cascader>
          </el-form-item>
          <el-form-item label="名称">
            <el-input autofocus clearable v-model="good.name"></el-input>
          </el-form-item>
          <el-form-item label="价格">
            <el-input clearable min="0" type="number" v-model.number="good.price"></el-input>
          </el-form-item>
          <el-form-item label="标签">
            <el-radio-group v-model="good.tag">
              <el-radio :label="'默认'">默认</el-radio>
              <el-radio :label="'商家推荐'">商家推荐</el-radio>
              <el-radio :label="'新货上架'">新货上架</el-radio>
              <el-radio :label="'精选好货'">精选好货</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="封面">
            <el-upload
              class="cover-uploader"
              :action="uploadUrl"
              :headers="getAuthHeader()"
              :show-file-list="false"
              :on-success="handleSuccess"
              :before-upload="beforeUpload"
            >
              <img v-if="good.cover" :src="good.cover" class="cover" />
              <i v-else class="el-icon-plus cover-uploader-icon"></i>
            </el-upload>
          </el-form-item>
        </el-tab-pane>
        <el-tab-pane label="详细信息">
          <el-form-item label="库存">
            <el-input
              autofocus
              clearable
              max="999"
              min="0"
              type="number"
              v-model.number="goodInfo.inventory"
            ></el-input>
          </el-form-item>
          <el-form-item label="销量">
            <el-input clearable type="number" min="0" v-model.number="goodInfo.sales"></el-input>
          </el-form-item>
          <el-form-item label="描述">
            <el-input clearable type="textarea" autosize v-model="goodInfo.describe"></el-input>
          </el-form-item>
          <el-form-item label="图片">
            <el-upload
              :action="uploadUrl"
              :headers="getAuthHeader()"
              list-type="picture-card"
              :on-success="handleWallSuccess"
              :before-upload="beforeUpload"
              :on-preview="handlePictureCardPreview"
              :on-remove="handleRemove"
              :file-list="goodInfo.pictures"
              multiple
              class="wall"
            >
              <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog :visible.sync="dialogVisible">
              <img width="100%" :src="dialogImageUrl" alt />
            </el-dialog>
          </el-form-item>
        </el-tab-pane>
        <el-tab-pane label="详情">
          <el-form-item label="内容">
            <vue-editor
              v-model="goodInfo.details"
              useCustomImageHandler
              @image-added="handleImageAdded"
            ></vue-editor>
          </el-form-item>
        </el-tab-pane>
        <el-form-item style="margin-top:1rem">
          <el-button type="primary" native-type="submit">更新</el-button>
        </el-form-item>
      </el-tabs>
    </el-form>
  </div>
</template>

<script>
	import { getCategoriesTree } from '../http/category';
	import { getGood, updateGood } from '../http/good';
	import { VueEditor } from 'vue2-editor';
	import http from '../http/http';
  
	export default {
		name:'GoodEdit',
		props:['id'],
		data() {
			return {
				dialogImageUrl: '',
				dialogVisible: false,
				disabled: false,
				good: {
					cover:'',
					name:'',
					price:'',
					tag:'',
				},
				category:{
					id:'',
				}, 
				pictures:[],
				goodInfo: {
					inventory:'',
					sales:'',
					pictures:[],
					describe:'',
					details:''
				},
				options: []
			};
		},
		components: {
			VueEditor,
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
									if (child.children.length==0) {
										child.children=null;
									}else {
										child.children.map((child)=>{
											child.children=null;
										});
									}
								})
								;			
							}
						}
					}
				});
				return ccc;
			},
			goodForm(){
				const goodInfo={ ...this.goodInfo };
				goodInfo.pictures=this.pictures;
				return {
					good:{ 
						...this.good, 
						goodInfo
					},
					category:this.category,
				};
			}
		},
		async created () {
			await	this.get();
			this.pictures=JSON.parse(JSON.stringify(this.goodInfo.pictures));
		},
		methods: {
			async get(){
				this.options=await getCategoriesTree();
				const good=	await getGood(this.id);
				this.category=good.category||{};
				this.good.name=good.name;
				this.good.cover=good.cover;
				this.good.price=good.price;
				this.good.tag=good.tag;
				const	{ goodInfo }=good;
				this.goodInfo=goodInfo;
			},
			beforeUpload(file){
				const isPic = file.type.startsWith('image/') ;
				const size=20;
				const isOverSize = file.size / 1024 / 1024 < size;

				if (!isPic) {
					this.$message.error('只能上传 图片 格式!');
				}
				if (!isOverSize) {
					this.$message.error(`上传图片大小不能超过 ${size} MB!`);
				}
				return isPic && isOverSize;
			}, 
			handleSuccess(res, file){
				this.$set(this.good, 'cover', res.url);
			},
			handleWallSuccess(res, file){
				const { filename, url }=res;
				const pic={
					name:filename, 
					url
				};
				this.pictures.push(pic);
			},
			handleRemove(file, fileList) {
				const	name=file.response?file.response.filename:file.name;
				this.pictures=this.pictures.filter(pic => pic.name!=name);
			},
			handlePictureCardPreview(file) {
				this.dialogImageUrl = file.url;
				this.dialogVisible = true;
			},
			async handleImageAdded(file, Editor, cursorLocation, resetUploader) {
				try {
					const formData = new FormData();
					formData.append('file', file);
					const res = await	http.post(this.uploadUrl, formData).catch(err =>err);
					Editor.insertEmbed(cursorLocation, 'image', res.url);
					resetUploader();
				} catch (error) {	return;}
			},
			async	update() {
				let res=	await updateGood(this.id, this.goodForm);
				this.$router.push('/good/list');
				this.$message({
					type: 'success',
					message: res.message
				});
			}
		},	
	};
</script>

<style scoped>
.cover-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  /* width: 178px; */
  min-width: 220px;
  height: 300px;
  line-height: 300px;
  text-align: center;
}

.el-input,
.el-textarea {
  width: 300px;
}

::v-deep .el-upload-list--picture-card .el-upload-list__item {
  overflow: hidden;
  background-color: #fff;
  border: 1px solid #c0ccda;
  border-radius: 6px;
  box-sizing: border-box;
  width: 260px;
  /* height: 148px; */
  margin: 0 8px 8px 0;
  display: inline-block;
}
</style>