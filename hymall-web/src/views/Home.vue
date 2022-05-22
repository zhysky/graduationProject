<template>
  <div class="home" style="margin-top: 10px">
    <div class="homeheader">
      <div class="category">
        <div>
          <v-list class="parent" color="#00bcd4" height="400">
            <v-list-item
              v-for="(item,n) in category"
              :key="item.name"
              @click="itemClick"
              @mouseenter="handleMouseEnter(n)"
              @mouseleave="handleMouseLeave"
            >
              <v-list-item-content>
                <v-list-item-title>
                  <h4 class="white--text text-center">{{item.name}}</h4>
                </v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </div>
        <div @mouseenter="handleCMouseEnter" @mouseleave="handleCMouseLeave">
          <v-list v-show="currCate" class="child" height="400">
            <router-link
              :to="`/search/cate/${item.id}`"
              v-for="item in childCategory"
              :key="item.name"
            >
              <v-list-item @click="itemClick">
                <v-list-item-content>
                  <v-list-item-title v-text="item.name"></v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </router-link>
          </v-list>
        </div>
      </div>
        <v-carousel
          cycle
          interval="3000"
          show-arrows-on-hover
          hide-delimiter-background
          height="400px"
        >
          <v-carousel-item
            v-for="(carousel,i) in carousels"
            :key="i"
            :to="`/details/${carousel.good_id}`"
            :src="carousel.src"
          ></v-carousel-item>
        </v-carousel>
    </div>
    <v-card class="good my-3 pa-0">
      <v-tabs v-model="tab" background-color="#00bcd4" dark>
        <v-tab v-for="item in tabs" :key="item.tab">{{ item.tab }}</v-tab>
      </v-tabs>
      <v-tabs-items v-model="tab">
        <v-tab-item class="pa-2" v-for="(good,n) in goods" :key="n">
          <div class="itemtgood d-flex flex-wrap">
            <template v-for="go in good">
              <Good :id="go.id" :title="go.name" :price="go.price" :cover="go.cover" :key="go.id" />
            </template>
          </div>
        </v-tab-item>
      </v-tabs-items>
    </v-card>

    <MFotter />
  </div>
</template>

<script>
import Good from '@/components/Good.vue';
import MFotter from '@/components/MFotter.vue';
import { getCategory } from '../api/category';
import { getCarouselList } from '../api/carousel';
import { getRecommedGoods, getNewGoods, getSelectGoods } from '../api/good';
export default {
  name: 'Home',
  components: {
    Good,
    MFotter
  },
  data() {
    return {
      currCate: '',
      tab: null,
      tabs: [
        { tab: '新货上架' },
        { tab: '商家推荐' },
        { tab: '精选好货' },
      ],
      carousels: [],
      goods: {
        'new': [],
        rec: [],
        sel: [],
      },
      category: [],
      timer: 0
    };
  },
  computed: {
    childCategory() {
      let res = this.category.filter(item => item.name == this.currCate);
      res = res.length == 0 ? [] : res[0].children;
      return res;
    }
  },
  created() {
    this.getCate();
    this.getCarouselList();
    this.getNewGoods();
    this.getRecommedGoods();
    this.getSelectGoods();
  },
  methods: {
    async	getCate() {
      let cate = await getCategory();
      this.category = cate;
    },
    async	getCarouselList() {
      let carousels = await getCarouselList();
      this.carousels = carousels[0];
    },
    async	getNewGoods() {
      let good = await getNewGoods();
      this.goods.new = good;
    },
    async	getRecommedGoods() {
      let good = await getRecommedGoods();
      this.goods.rec = good;
    },
    async	getSelectGoods() {
      let good = await getSelectGoods();
      this.goods.sel = good;
    },
    itemClick() {
      return;
    },
    handleMouseEnter(n) {
      this.currCate = this.category[n].name;
      clearTimeout(this.timer);
    },
    handleMouseLeave() {
      this.timer = setTimeout(() => {
        this.currCate = '';
      }, 150);
    },
    handleCMouseEnter() {
      clearTimeout(this.timer);
    },
    handleCMouseLeave() {
      this.currCate = '';
    },
  },
};
</script>
<style lang="stylus" scoped>
.home
  margin 0 auto
  min-width 1044px

.homeheader
  width 1244px
  margin 0 auto
  display flex

.v-window__container
  margin 0 auto

.category
  width 200px
  z-index 1
  position relative

.v-list
  width 200px
  border-radius 0
  box-sizing border-box

.child
  position absolute
  top 0
  right -200px

.good
  margin 0 auto
  max-width 1244px
  min-width 941px
  min-height 648px

.v-image__image,
.v-image__image--cover
  line-height 400px
</style>
