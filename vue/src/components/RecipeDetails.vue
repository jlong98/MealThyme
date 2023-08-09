<template>
  <div class="recipe-details">
    <div class="name-details">
      <h2 class="recipe-name">
        {{ recipe.name }}
        <router-link :to="{name: 'recipe-update',params: {recipe : recipe}}"><button class="edit-button">Edit</button></router-link>
        <router-link :to="{name: 'all-recipes'}"><button class="remove-button" v-on:click="deleteRecipe(recipe.recipeId)">Remove</button></router-link>
      </h2>
    </div>
    <div>
      <img id="detail-img" v-if="recipe.image" v-bind:src="recipe.image"/>
    </div>
    <div class="recipe-info">
      <h3 class="recipe-calories"> Calories: {{ recipe.calories }}</h3>
      <p class="recipe-ingredients">Ingredients: {{ recipe.ingredients }}</p>
      <hr>
      <p class="recipe-directions">Directions: {{ recipe.directions }}</p>
    </div>
  </div>
</template>

<script>

import RecipeService from '@/services/RecipeService';
export default {
    name: "recipe-details",
    props: {
        recipeId : Number
    },
    data() {
      return {
        recipe: {
        id: 0,
        image: '',
        name: '',
        ingredients: '',
        directions: '',
        calories: 0,
        is_low_fat: false,
        is_high_protein: false,
        is_low_carb: false,
        is_low_sodium: false,
        is_breakfast: false,
        is_lunch: false,
        is_dinner: false,
        saved: false,
        }
      }
    },
    created() {
      RecipeService.getRecipe(this.$route.params.id).then(response => {
        this.recipe = response.data;
      });
    },
    methods: {
        deleteRecipe(recipeId) {
            this.isSaved = !this.isSaved;
            RecipeService.removeRecipe(recipeId);
        }
    }

}
</script>

<style>
.recipe-details{
  max-width: 80%;
  margin-left: 5%;
  font-family: 'Arial';
}
#detail-img{
  min-width: 50%;
  max-width: 75%;
  min-height: 50%;
  max-height: 75%;
  
}

.recipe-info {
  background-color: #f7bfb4;
  border: 2px solid #5b4b49;
  border-radius: 10px;
}

.edit-button {
    background-color: #db93b0;
    color: white;
    border-color: #db93b0;
    font-size: 18px; 
    transition-duration: 0.4s;
}

.remove-button {
    background-color: #db93b0;
    color: white;
    border-color: #db93b0;
    font-size: 18px; 
    transition-duration: 0.4s;
}

</style>