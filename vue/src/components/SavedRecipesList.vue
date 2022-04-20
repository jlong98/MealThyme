<template>
  <div class="my-saved-recipe-list">
    <h2 class="header-text">My Saved Recipes</h2>
    <div class="saved-recipes">
      <recipe-card v-on:savedChange="filteredRecipes" v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe"/>
    </div>
  </div>
</template>

<script>
import RecipeCard from "./RecipeCard.vue";
import recipeService from "@/services/RecipeService";

export default {
  name: "my-saved-recipe-list",
  components: {
    RecipeCard,
  },
  data() {
    return {
      recipes: [],
    };
  },
  methods: {
    filteredRecipes(){
      recipeService.getRecipesBySaved(this.$store.state.user.id).then((response) => {
        this.recipes = response.data.filter(recipe => {
          return recipe.saved;
        });
    });
    }
  },
  created() {
    this.filteredRecipes();
}
};
</script>

<style >
.my-saved-recipe-list {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
  flex-direction: column;
}

.saved-recipes {
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
}

.header-text {
  font-family: Arial, Helvetica, sans-serif;
}
</style>