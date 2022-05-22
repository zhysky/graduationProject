<template>
  <div class="t-profile">
    <div class="profile">
      <v-card height="100%" class="my-1">
        <v-toolbar flat color="secondary" dark>
          <v-toolbar-title>用户信息</v-toolbar-title>
        </v-toolbar>
        <v-tabs vertical>
          <v-tab>
            <v-icon left>mdi-account</v-icon>基础信息
          </v-tab>
          <v-tab>
            <v-icon left>mdi-home-city-outline</v-icon>收货信息
          </v-tab>
          <v-tab>
            <v-icon left>mdi-reorder-horizontal</v-icon>我的订单
          </v-tab>

          <v-tab-item>
            <v-card class="pa-4" flat>
              <el-form :model="userInfo" :rules="rules" ref="userInfo" label-width="100px">
                <el-form-item label="头像">
                  <el-upload
                    class="avatar-uploader"
                    :action="uploadUrl"
                    :headers="getAuthHeader()"
                    :show-file-list="false"
                    :on-success="handleAvatarSuccess"
                    :before-upload="beforeUpload"
                  >
                    <img v-if="userInfo.avatar" :src="userInfo.avatar" class="avatar" />
                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                  </el-upload>
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                  <el-input v-model="userInfo.email"></el-input>
                </el-form-item>
                <el-form-item label="手机" prop="phone">
                  <el-input v-model="userInfo.phone"></el-input>
                </el-form-item>
                <el-form-item label="性别" prop="sex">
                  <el-radio-group v-model="userInfo.sex">
                    <el-radio label="男"></el-radio>
                    <el-radio label="女"></el-radio>
                  </el-radio-group>
                </el-form-item>

                <el-form-item>
                  <v-btn color="primary" @click="updateInfo">保存</v-btn>
                </el-form-item>
              </el-form>
            </v-card>
          </v-tab-item>
          <v-tab-item>
            <v-card class="pa-4" flat>
              <el-form :model="user" ref="address" label-width="150px">
                <template v-for="(add, index) in user.address">
                  <div :key="index">
                    <h4>地址{{index+1}}</h4>
                    <el-form-item
                      label="收件人姓名"
                      :prop="'address.' + index + '.name'"
                      :rules="rules.name"
                    >
                      <el-input v-model.trim="add.name"></el-input>
                    </el-form-item>
                    <el-form-item
                      label="收件人联系方式"
                      :prop="'address.' + index + '.phone'"
                      :rules="rules.phone"
                    >
                      <el-input v-model="add.phone"></el-input>
                    </el-form-item>
                    <el-form-item
                      label="详细地址"
                      :prop="'address.' + index + '.address'"
                      :rules="rules.address"
                    >
                      <el-input
                        type="textarea"
                        :rows="2"
                        placeholder="请输入详细地址"
                        v-model.trim="add.address"
                      ></el-input>
                    </el-form-item>

                    <el-form-item>
                      <v-btn @click.prevent="removeAddress(add)">删除</v-btn>
                    </el-form-item>
                  </div>
                </template>
                <el-form-item>
                  <v-btn class="mr-5" @click="addAddress">新增地址</v-btn>
                  <v-btn color="primary" @click="updateAddress">保存</v-btn>
                </el-form-item>
              </el-form>
            </v-card>
          </v-tab-item>
          <v-tab-item>
            <v-card flat>
              <div class="order">
                <div v-if="!orders.length" class="text-center info--text mt-2 pa-3">没有订单</div>
                <template v-else v-for="order in orders">
                  <v-card class="order-item info--text mt-2 pa-3" :key="order.id">
                    <div class="d-flex flex-wrap justify-space-between subtitle-2">
                      <div style="width:50%">
                        <span class="grey--text text--darken-2">订单编号:</span>
                        {{order.id}}
                      </div>
                      <div style="width:25%">
                        <span class="grey--text text--darken-2">创建时间:</span>
                        {{order.createTime|formatDate}}
                      </div>
                      <div style="width:25%">
                        <span class="grey--text text--darken-2">支付价格:</span>
                        {{order.total}} 元
                      </div>
                      <div style="width:50%">
                        <span class="grey--text text--darken-2">邮费:</span>
                        {{order.post}}
                      </div>
                      <div style="width:50%">
                        <span class="grey--text text--darken-2">支付方式:</span>
                        {{order.payment_type}}
                      </div>
                    </div>
                    <details>
                      <summary class="subtitle-2 grey--text text--darken-2">收货信息</summary>
                      <div class="d-flex flex-wrap justify-space-between">
                        <div style="width:50%">
                          <span class="body-2 grey--text text--darken-2">收件人姓名:</span>
                          <span class="caption">{{order.address?order.address.name:''}}</span>
                        </div>

                        <div style="width:50%">
                          <span class="body-2 grey--text text--darken-2">收件人联系方式:</span>
                          <span class="caption">{{order.address?order.address.phone:''}}</span>
                        </div>

                        <div style="width:100%">
                          <span class="body-2 grey--text text--darken-2">详细地址:</span>
                          <span class="caption">{{order.address?order.address.address:''}}</span>
                        </div>
                      </div>
                    </details>
                    <details>
                      <summary class="subtitle-2 grey--text text--darken-2">商品详情</summary>
                      <v-simple-table dense>
                        <template v-slot:default>
                          <thead>
                            <tr>
                              <th class="text-left">商品名</th>
                              <th class="text-left">单价</th>
                              <th class="text-left">数量</th>
                              <th class="text-left">总价</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr v-for="item in order.goods" :key="item.title">
                              <td>{{ item.title }}</td>
                              <td>{{ item.price }}</td>
                              <td>{{ item.num }}</td>
                              <td>{{ item.price*item.num }}</td>
                            </tr>
                          </tbody>
                        </template>
                      </v-simple-table>
                    </details>
                  </v-card>
                </template>
              </div>
              <div class="my-5 text-center">
                <el-pagination
                  @size-change="handleSizeChange"
                  @current-change="handleCurrentChange"
                  :current-page="currentPage"
                  :page-sizes="[10,15,20]"
                  :page-size="pageSize"
                  layout="total, sizes, prev, pager, next, jumper"
                  :total="count"
                ></el-pagination>
              </div>
            </v-card>
          </v-tab-item>
        </v-tabs>
      </v-card>
    </div>
    <MFotter />
  </div>
</template>

<script>
	import MFotter from '@/components/MFotter.vue';
	import { updateInfo, updateAddress } from '../api/user';
	import { Message } from 'element-ui';
	import { getOrder } from '../api/order';
	export default {
		name:'profile',
		components: {
			MFotter
		},
		data() {
			return {
				userInfo: {
					avatar: '',
					email: '',
					phone: '',
					sex: '',
				},

				user:{
					address: [],
				},
				orders:[],
				rules: {
					email: [
						{ type: 'email',
							message: '请输入正确的邮箱地址',
							trigger: ['blur'] }
					],
					name: [
						{ required: true,
							message: '请输入姓名',
							trigger: ['blur'] }
					],
					phone: [
						{ required: true, 
							pattern: /^1[34578]\d{9}$/,
							message: '只支持中国大陆的手机号码',
							trigger: 'blur' }
					],
					address:{
						required: true,
						message: '地址不能为空',
						trigger: 'blur'
					}
				},
				page:1,
				currentPage:1,
				pageSize:10,
				count:0
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
		created () {
			this.getUserInfo();
			this.getUserOrder();
		},
		methods: {
			getUserOrder(){
				getOrder(this.skip, this.take).then(res=>{
					[this.orders, this.count]=res;
				}).catch(err =>err);
			},
			getUserInfo(){
				this.$set(this.user, 'address', this.$store.state.user.address||[]);
				this.userInfo = this.$store.state.user.userInfo;
			},
			updateInfo() {
				this.$refs.userInfo.validate(async (valid) => {
					if (valid) {
						const res= await	updateInfo(this.userInfo);
						await	this.$store.dispatch('updateInfo');
						Message.success(res.message );
					} else {
						return false;
					}
				});
			},
			updateAddress() {
				this.$refs.address.validate(async (valid) => {
					if (valid) {
						const res= await	updateAddress(this.user.address);
						this.$store.dispatch('updateInfo');
						Message.success(res.message );
					} else {
						return false;
					}
				});
			},
      
			resetForm(formName) {
				this.$refs[formName].resetFields();
			},
      
			removeAddress(item) {
				var index = this.user.address.indexOf(item);
				if (index !== -1) {
					this.user.address.splice(index, 1);
				}
			},
			createAddress(){
				return {
					name:'',
					phone:'',
					address:''
				};
			},
			addAddress() {
				this.user.address.push(this.createAddress());
			},
			handleAvatarSuccess(res) {
				this.$set(this.userInfo, 'avatar', res.url);
			},
			beforeUpload(file) {
				const isPic = file.type.startsWith('image/') ;
				const size=20;
				const isOverSize = file.size / 1024 / 1024 < size;

				if (!isPic) {
					Message.error('只能上传 图片 格式!');
				}
				if (!isOverSize) {
					Message.error(`上传图片大小不能超过 ${size} MB!`);
				}
				return isPic && isOverSize;
			},
      
			handleSizeChange(val) {
				this.pageSize=val;
				this.getUserOrder();
			},
			handleCurrentChange(val) {
				this.currentPage=val;
				this.getUserOrder();
			},

		},
		filters:{
			formatDate(val) {
				var value=new Date(Number(val));
				var year=value.getFullYear();
				var month=value.getMonth()+1;
				var day=value.getDate();
				var hour=value.getHours();
				var minutes=value.getMinutes();
				var seconds=value.getSeconds();
				return year+'-'+month+'-'+day+' '+hour+':'+minutes+':'+seconds;
			}
		}
	};
</script>

<style lang="stylus" scoped>
.t-profile {
  min-height: calc(100vh - 64px);
}

.profile {
  width: 1000px;
  margin: auto;
  min-height: calc(100vh - 64px - 100px);
}

.v-card {
  min-height: 720px;
}

.order {
  min-height: 700px;
}

.order-item {
  min-height: 100px;
}

.icon-uploader-icon, .icon {
  width: 5rem;
  height: 5rem;
  line-height: 5rem !important;
}
</style>