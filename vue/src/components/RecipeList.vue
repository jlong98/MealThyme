<template>
  <div class="my-recipe-list">
    <div class="recipes">
      <recipe-card v-on:savedChange="filteredRecipes" v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.id"/>
    </div>
  </div>
</template>

<script>
import RecipeCard from "./RecipeCard.vue";
import recipeService from "@/services/RecipeService";

export default {
  name: "my-recipe-list",
  props: ["searchValue",],
  components: {
    RecipeCard,
  },
  data() {
    return {
      recipes: [],
    };
  },
  methods: {
    filteredRecipes() {
      if (this.searchValue) {
        recipeService.getRecipesByName(this.$store.state.user.id, this.searchValue).then(response => {
            this.recipes = response.data;
        });
      }else{
        recipeService.getRecipesBySaved(this.$store.state.user.id).then((response) => {
          this.$store.commit("ADD_RECIPES",response.data);
          this.recipes = response.data;
        });
      }
    }
  },
  created() {
    this.filteredRecipes();
  },
};
</script>

<style >
.my-recipe-list {
  
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
  flex-direction: column;
}
.recipes {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
</style>