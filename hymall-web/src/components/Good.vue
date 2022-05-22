<template>
  <div>
    <v-card width="180" hover color="secondary lighten-5" class="ma-3" absolute>
      <v-img
        @click="toDetail"
        height="200px"
        lazy-src="https://picsum.photos/id/11/100/60"
        :aspect-ratio="3/4"
        class="white--text align-end"
        :src="cover"
      ></v-img>

      <div @click="toDetail" class="px-3">
        <p class="mt-2 mb-0">{{title}}</p>
      </div>

      <div class="d-flex align-center justify-space-between">
        <span class="px-3" style="width:90px;">
          <span style="color:#FF5722;">￥</span>
          <span>{{price}}</span>
        </span>
        <!-- <v-btn icon>
          <v-icon>mdi-heart</v-icon>
        </v-btn>-->
        <v-btn @click="addTOCart($event,{id,title,cover,price,num:1})" icon>
          <v-icon style="color:#E57373;">mdi-cart-plus</v-icon>
        </v-btn>
      </div>
    </v-card>
  </div>
</template>

<script>
export default {
  name: 'Good',
  props: {
    id: {
      type: String,
      'default': ''
    },
    title: {
      type: String,
      'default': '卡片标题'
    },
    cover: {
      type: String,
      'default': 'https://picsum.photos/id/11/180/100'
    },
    price: {
      type: Number,
      'default': 9999
    },
  },
  methods: {
    toDetail() {
      this.$router.push(`/details/${this.id}`);
    },
    addTOCart(e, payload) {
      this.$store.dispatch('toCart', payload);
    }
  },
};
</script>

<style lang="stylus" scoped>
.v-card p
  overflow hidden
  text-overflow ellipsis
  white-space nowrap
</style>