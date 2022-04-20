<template>
  <form>
      <h1>Update Recipe</h1>
      <div class="update-field">
          <div class="name-field">
            <label for="name">Name: </label>
            <input type="text" v-model="recipe.name"/>
            <label for="calories">Calories: </label>
            <input type="number" v-model="recipe.calories"/>
          </div>
          <div class="directions-field">
            <label for="directions">Directions: </label>
            <textarea id="directions-box" type="text" v-model="recipe.directions"/>
          </div>
          <div class="ingredients-field">
              <label for="ingredients">Ingredients: </label>
              <textarea id="ingredients-box" type="text" v-model="recipe.ingredients"/>
          </div>
          <div class="submit-field">
              <router-link :to="{name: 'all-recipes'}"><button type="submit" v-on:click="sendUpdatedRecipe()">Submit</button></router-link>
          </div>
      </div>
  </form>
</template>

<script>

import RecipeService from '@/services/RecipeService';

export default {
    name: 'update-recipe',
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
                saved: false,
            }
        }
    },
    methods: {
        sendUpdatedRecipe(){
            const updatedRecipe = {
                image: this.recipe.image,
                name: this.recipe.name,
                ingredients: this.recipe.ingredients,
                directions: this.recipe.directions,
                calories: this.recipe.calories,
                is_low_fat: this.recipe.is_low_fat,
                is_high_protein: this.recipe.is_high_protein,
                is_low_carb: this.recipe.is_low_carb,
                is_low_sodium: this.recipe.is_low_sodium,
                saved: this.recipe.saved,
            }
            RecipeService.sendRecipe(updatedRecipe);
        }
    },
    created() {
        RecipeService.getRecipe(this.$route.params.id).then(response => {
            this.recipe = response.data;
      });
    }

}
</script>

<style>

.update-field {
    border-radius: 100px;
    background-color: #F7BFB4;
    border: 2px solid #5b4b49;
    margin-left: 150px;
    margin-right: 150px;
    margin-bottom: 150px;
    margin-top: 25px;
    padding: 10%;
    font-family: 'Arial';
    text-align: center;
}

.name-field {
    padding:10px;
}

.calories-field {
    padding: 10px;
}

.directions-field {
    padding: 10px;
}

.ingredients-field {
    padding: 10px;
}

.submit-field {
    padding: 10px;
}

#directions-box {
    width: 500px;
    height: 150px;
}

#ingredients-box {
    width: 500px;
    height: 150px;
}

</style>