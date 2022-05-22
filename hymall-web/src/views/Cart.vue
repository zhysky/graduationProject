<template>
  <div class="cart">
    <v-card class="d-flex flex-column mx-auto my-4 pb-4" style="height:100%;width: 70%;">
      <div class="pa-4 title font-weight-black">购物车</div>
      <div
        class="pa-5 flex-grow-1 d-flex flex-column justify-center text-center"
        v-if="!cartArr.length"
      >购物车是空的</div>
      <div v-else>
        <el-table :data="cartArr" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column label="名称">
            <template slot-scope="scope">
              <router-link tag="a" :to="`details/${scope.row.good_id}`">{{ scope.row.title }}</router-link>
              <!-- <span>{{ scope.row.title }}</span> -->
            </template>
          </el-table-column>
          <el-table-column label="单价">
            <template slot-scope="scope">
              <span>{{ scope.row.price }}</span>
            </template>
          </el-table-column>
          <el-table-column label="数量">
            <template slot-scope="scope">
              <div class="pa-1">
                <v-btn @click="decrement(scope.$index)" x-small>-</v-btn>
                <input
                  style="width: 30px;text-align: center;"
                  v-model.number="scope.row.num"
                  @blur="input(scope.$index,scope.row.num)"
                />
                <v-btn @click="increment(scope.$index)" x-small>+</v-btn>
              </div>
            </template>
          </el-table-column>
          <el-table-column label="总价">
            <template slot-scope="scope">
              <span>{{ scope.row.price*scope.row.num }}</span>
            </template>
          </el-table-column>
          <el-table-column label="操作" width="180">
            <template slot-scope="scope">
              <v-btn class="mx-2" dark small color="pink" @click="handleDelete(scope.$index)">删除</v-btn>
            </template>
          </el-table-column>
        </el-table>
        <div class="ma-4 d-flex justify-space-around align-center">
          <div>
            <v-btn @click="delCart" color="secondary" text large>清空购物车</v-btn>
          </div>
          <div style="width: 200px;text-align: center;">
            合计：
            <span style="color:#F44336;font-size:30px">￥ {{total}}</span>
          </div>
          <div>
            <v-btn :disabled="!cartSelection.length" @click="balance" color="warning">结算</v-btn>
          </div>
        </div>
      </div>
    </v-card>
    <MFotter />
  </div>
</template>

<script>
	import { mapState } from 'vuex';
	import MFotter from '@/components/MFotter.vue';


	export default {
		name:'Cart',
		computed: {
			...mapState(['cartArr']),
			total(){
				let tol=0;
				this.cartSelection.map(item =>{
					tol+=item.num*item.price;
				});
				return tol;
			}
		},
		data () {
			return {
				cartSelection: []
			};
		},
		components: {
			MFotter
		},
		methods: {
			decrement (index) {
				this.$store.dispatch('cartReduce', index);
			},
			increment (index) {
				this.$store.dispatch('cartAdd', index);
			},
			input (index, num) {
				if (num <= 1) {
					num = 1;
				}
				this.$store.dispatch('cartInput', { index,
					num });
			},
			handleDelete( index) {
				this.$store.dispatch('cartRemove', index);
			},
			delCart(){
				this.$store.dispatch('delCart');
			},
			handleSelectionChange(val) {
				this.cartSelection = val;
			},
			async	balance(){
				this.$store.commit('cartSelection', this.cartSelection);
				this.$router.push('/order');
			}
		},
	};
</script>

<style lang="stylus" scoped>
.cart {
  min-height: calc(100vh - 80px);
}

.v-card {
  min-height: calc(100vh - 200px);
}
</style>