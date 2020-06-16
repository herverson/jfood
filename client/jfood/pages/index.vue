<template>
  <v-layout
    column
    justify-center
    align-center
  >
    <v-flex
      xs12
      sm8
      md6
    >
      <div class="text-center">
        <logo />
        <vuetify-logo />
      </div>
      <v-card>
        <v-card-title class="headline">
          Welcome to the Vuetify + Nuxt.js template
        </v-card-title>
        <v-card-text>
          <v-list>
        <v-list-item
          v-for="(item, i) in products"
          :key="i"
        >
          <v-list-item-content>
            <v-list-item-title v-text="item.name" />
            R$ {{ item.price }}
            <v-img
              :src="`http://localhost:4000${item.image}`"
              aspect-ratio="1"
              class="grey lighten-2"
            >
            </v-img>
          </v-list-item-content>
        </v-list-item>
      </v-list>
        </v-card-text>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
  import axios from '~/plugins/axios'

  export default {
    async asyncData () {
      const { data } = await axios.get('/categories/fruits')
      return { products: data.data }
    }
  }
</script>
