<template>
  <v-container>
    <v-row dense>
      <v-col
        v-for="(product,n) in products"
        :key="n"
        sm="6"
        md="4"
      >
        <v-card>
          <v-img
            :src="product.imageUrl"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="250px"
          >
          </v-img>
          <v-card-title v-text="product.name"></v-card-title>
          <v-card-text
            style="position: relative;"
          >
          <v-btn
            absolute
            color="orange"
            class="white--text"
            fab
            large
            right
            top
            @click="addItem(product)"
          >
            <v-icon>mdi-cart</v-icon>
          </v-btn>
          <v-row
            align="center"
            class="mx-0"
          >
            <v-rating
              :value="4.5"
              color="amber"
              dense
              half-increments
              readonly
              size="14"
            ></v-rating>

            <div class="grey--text ml-4">4.5 (413)</div>
          </v-row>

          <div class="my-4 subtitle-1">
            {{ formatMoney(product.price) }}
          </div>

          <div>{{ product.description }}</div>
        </v-card-text>

          <v-divider class="mx-4"></v-divider>
          <v-card-actions>
            <v-spacer></v-spacer>

            <v-btn icon>
              <v-icon>mdi-heart</v-icon>
            </v-btn>

            <v-btn icon>
              <v-icon>mdi-bookmark</v-icon>
            </v-btn>

            <v-btn icon>
              <v-icon>mdi-share-variant</v-icon>
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
    <v-col class="md-12">
      <h5>Pedidos #{{ Math.floor(Math.random() * 10000) }}</h5>
      <hr/>
      <div v-if="order.products.length === 0">
        <br/>
        <br/>
        <h5>Carrinho vazio</h5>
      </div>
      <v-row v-for="orderItem in order.products" v-bind:key="orderItem.item.id">
        <v-col class="md-1">
          {{ orderItem.quantity }}
        </v-col>
        <v-col class="md-5">
          {{ orderItem.item.name }}
        </v-col>
        <v-col class="md-3">
          {{ formatMoney(orderItem.quantity * orderItem.item.price) }}
        </v-col>
        <v-btn icon @click="deleteItem(orderItem.item)">
          <v-icon>mdi-minus</v-icon>
        </v-btn>
      </v-row>
      <br/>
      <v-btn 
      color="success"
      @click="saveOrder()"
      >
        Confirmar ({{ formatMoney(order.total) }})
      </v-btn>
    </v-col>
  </v-container>
</template>

<script>
import axios from 'axios/dist/axios'


export default {
  name: 'Home',

  data: () => ({
    products: [],
    loading: false,
    selection: 1,
    messages: 0,
    show: false,
    order: {
      status: '??',
      products: [],
      total: 0
    }
  }),
  created() {
    axios
        .get('http://localhost:4000/api/products')
        .then(response => (this.products = response.data.data))
  },
  methods: {
    addCart(value) {
      this.$emit("addCart", value);
    },
    formatMoney(value) {
			const formatter = new Intl.NumberFormat("pt-BR", {
				style: "currency",
				currency: "BRL"
			});
			return formatter.format(value);
		},
    reserve () {
      this.loading = true

      setTimeout(() => (this.loading = false), 2000)
    },
    addItem(item) {
			const orderItem = this.order.products.find(orderItem => orderItem.item.id === item.id);
			if (!orderItem) {
				this.order.products.push({
					quantity: 1,
					item
				});
			} else {
				orderItem.quantity++;
			}
      this.order.total += item.price;
      this.addCart(1);
		},
		deleteItem(item) {
			const orderItem = this.order.products.find(orderItem => orderItem.item.id === item.id);
			if (!orderItem) return;
			if (orderItem.quantity === 1) {
				this.order.products.splice(this.order.products.indexOf(orderItem), 1);
			} else {
				orderItem.quantity--;
			}
      this.order.total -= item.price;
      this.addCart(-1);
    },
    saveOrder() {
      console.log(this.order);
      this.order.user_id = 1
      const order = {
        order: this.order
      }
      axios.post('http://localhost:4000/api/orders', order).then(() => {
      
    });
    }
  },
}
</script>
