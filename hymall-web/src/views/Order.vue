<template>
  <div class="mx-auto pa-5 d-flex flex-column" style="width:1200px;">
    <div>
      <strong style="color: rgba(0, 0, 0, 0.6);">选择收货地址</strong>
    </div>
    <div class="mx-auto">
      <v-radio-group v-model="addressSelection" :mandatory="true">
        <div v-if="!address.length" style="width:1200px;" class="mx-auto text-center">
          <router-link tag="a" to="/profile">请先添加收货信息</router-link>
        </div>
        <div v-else class="mx-auto d-flex flex-wrap" style="width:1000px;">
          <template v-for="(add,i) in address">
            <div :key="i">
              <v-radio :value="add" class="mx-3">
                <template v-slot:label>
                  <v-card min-height="180" style="width:270px;">
                    <div class="mx-auto pa-3 d-flex flex-column">
                      <div class="ma-1">
                        <strong class="font-weight-bold subtitle-2">收件人姓名:</strong>
                        <span class="caption">{{add.name}}</span>
                      </div>
                      <div class="ma-1">
                        <strong class="font-weight-bold subtitle-2">收件人联系方式:</strong>
                        <span class="caption">{{add.phone}}</span>
                      </div>
                      <div class="ma-1">
                        <p class="caption mb-0">
                          <strong class="font-weight-bold subtitle-2">详细地址:</strong>
                        </p>
                        <span class="ad caption mt-0">{{add.address}}</span>
                      </div>
                    </div>
                  </v-card>
                </template>
              </v-radio>
            </div>
          </template>
        </div>
      </v-radio-group>
    </div>
    <div class="mx-auto mt-4" style="width:1200px;">
      <p>
        <strong style="color: rgba(0, 0, 0, 0.6);">商品清单</strong>
      </p>
      <div class="mx-auto" style="width:1000px;">
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
              <tr v-for="item in goods" :key="item.name">
                <td>{{ item.title }}</td>
                <td>{{ item.price }}</td>
                <td>{{ item.num }}</td>
                <td>{{ item.price*item.num }}</td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>
        <div class="text-right mt-1">
          <div>
            邮费(满80包邮):
            <span style="color:#F44336;font-size:20px">￥ {{post}}</span>
          </div>
          <div>
            合计:
            <span style="color:#F44336;font-size:20px">￥ {{total+post}}</span>
          </div>
        </div>
      </div>
    </div>
    <div class="mx-auto" style="width:1200px;">
      <p>
        <strong style="color: rgba(0, 0, 0, 0.6);">支付</strong>
      </p>
      <div class="text-right mx-auto mt-5" style="width:1000px;">
        <v-radio-group v-model="payment_type" row>
          <v-radio label="支付宝" color="primary" value="支付宝"></v-radio>
          <v-radio label="微信" color="primary" value="微信"></v-radio>
        </v-radio-group>
        <v-btn color="warning" class="mr-5" @click="cancel">取消订单</v-btn>
        <v-btn color="success" @click="order">确认支付</v-btn>
      </div>
    </div>
  </div>
</template>

<script>
	import { getInfo } from '../api/user';
	import { createOrder } from '../api/order';
	import { Message } from 'element-ui';
	export default {
		name:'Order',
		data() {
			return {
				goods: [],
				address:[],
				addressSelection:{},
				payment_type:'支付宝'
			};
		},
		computed: {
			total() {
				let total = 0;
				this.goods.map(item => {
					total += item.num * item.price;
				});
				return total; 
			},
			post(){
				if (this.goods.length==0) {
					return 0;
				}else{
					return this.total>=80?0:12;
				}
			}
		},
		async	created () {
			this.goods=this.$store.state.cartSelection;
			const { data: {  address } } = await getInfo();
			if (address&&address.address) {
				this.address=address.address;
				this.addressSelection=address[0];
			}
		},
		methods: {
			async	order() {
				if (this.goods.length==0) {
					return;
				}
				if (!this.addressSelection) {
					Message.warning('请先添加收货信息');
					return;
				}
				const date=new Date();
				const res =	await createOrder({ 
					total:this.total,
					goods:this.goods,
					post: this.post,
					address:this.addressSelection,
					payment_type:this.payment_type,
					createTime:date.getTime(),
				});
				this.$store.dispatch('clearCart');
				this.goods=[];
				Message.success(res.message);
				this.$router.push('/');
			},
			cancel(){
				this.$store.commit('cartSelection', []);
				this.$router.push('/');
			}
		},
	};
</script>

<style scoped>
.ad {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}
</style>