<template>
  <div>
    <div class="details">
      <v-card class="pa-3">
        <div class="d-flex justify-space-around">
          <div>
            <v-img contain width="400" max-height="400" :src="good.cover"></v-img>
          </div>

          <div class="d-flex flex-column flex-grow-1">
            <div class="name">
              <p>{{good.name}}</p>
            </div>
            <div class="price">
              价格:
              <p>￥{{good.price}}</p>
            </div>
            <div>
              <div>
                <span class="font-weight-bold">库存:</span>
                {{good.goodInfo.inventory}}
              </div>
              <div>
                <span class="font-weight-bold">销量:</span>
                {{good.goodInfo.sales}}
              </div>
            </div>

            <div class="number d-flex align-center">
              <v-btn @click="decrement" x-small>-</v-btn>
              <input v-model.number="num" />
              <v-btn @click="increment" x-small>+</v-btn>
            </div>
            <div>
              <v-btn
                @click="addTOCart($event,{id,title:good.name,cover:good.cover,price:good.price,num})"
                large
                color="error"
              >加入购物车</v-btn>
            </div>
          </div>
        </div>
      </v-card>
      <v-card class="my-3 pa-3">
        <span class="d-block font-weight-bold mb-3">商品图片:</span>
        <div class="d-flex justify-start flex-wrap">
          <template v-for="(picture,n) in good.goodInfo.pictures">
            <div style="width:400px" :key="n" class="my-3 align-self-center pa-3">
              <v-img contain width="100%" :src="picture.url" :key="n"></v-img>
            </div>
          </template>
        </div>
      </v-card>
      <v-card class="my-3 pa-3">
        <span class="font-weight-bold">商品介绍:</span>
        <div class="detail pt-4" v-html="good.goodInfo.details"></div>
      </v-card>
    </div>
    <MFotter />
  </div>
</template>

<script>
	import { getGoodDetail } from '../api/good';
	import MFotter from '@/components/MFotter.vue';
	export default {
		name:'Detail',
		props: {
			id:String,
		},
		components: {
			MFotter
		},
		data() {
			return {
				good: { goodInfo:{} },
				num:1
			};
		},
		created(){
			this.fetch();
		},
		methods: {
			async	fetch() {
				this.good=await	getGoodDetail(this.id);
			},
			decrement () {
				if (this.num<=0) return;
				this.num--;
			},
			increment () {
				this.num++;
			},
			addTOCart(e, payload){
				this.$store.dispatch('toCart', payload);
			}
		},
	};
</script>

<style lang="stylus" scoped>
.details {
  margin: 10px auto;
  width: 70%;
  min-width: 424px;
}

::v-deep .detail p {
  text-indent: 2rem;
}

.v-card {
  min-width: 600px !important;
}

.name p {
  font-size: 30px;
  font-weight: 700;
}

.price p {
  display: inline-block;
  color: rgb(243, 2, 64);
  font-size: 30px;
  line-height: 0.8;
  font-weight: 700;
}

.number {
  font-size: 20px;
  display: inline;
}

.number v-btn {
  border: 1px solid #9e9e9e;
  font-size: 20px;
  width: auto;
}

.number input {
  /* border: 1px solid #9e9e9e; */
  font-size: 20px;
  display: inline-block;
  width: 40px;
  padding: 8px;
  text-align: center;
}
</style>