<template>
  <v-container>
    <v-row dense>
      <v-col
        v-for="card in cards"
        :key="card.id"
        :cols="4"
      >
        <v-card>
          <v-img
            :src="card.imageUrl"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="250px"
          >
          </v-img>
          <v-card-title v-text="card.name"></v-card-title>
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
            R$ {{ card.price }}
          </div>

          <div>{{ card.description }}</div>
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
  </v-container>
</template>

<script>
import axios from 'axios/dist/axios'


export default {
  name: 'Home',

  data: () => ({
    cards: [],
    loading: false,
    selection: 1,
  }),
  created() {
    axios
        .get('http://localhost:4000/api/products')
        .then(response => (this.cards = response.data.data))
  },
  methods: {
    reserve () {
      this.loading = true

      setTimeout(() => (this.loading = false), 2000)
    },
  },
}
</script>
