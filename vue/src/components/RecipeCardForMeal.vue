<template>
<div>
  <div class="card" v-bind:key="recipe.recipeId">
  <h2 class="recipe-name"> {{ recipe.name }}</h2>
  <router-link v-bind:to="{name: 'recipe', params: {id : recipe.recipeId}}">
        <img id="RCFMI" v-if="recipe.image" v-bind:src="recipe.image"/>
  </router-link>
  <h3 class="recipe-calories"> Calories: {{ recipe.calories }}</h3>
  <div class="checkbox-container">
    <!-- v-bind:value="isChecked" -->
      <input type="checkbox" id="addRecipe"  v-on:change="saveChecked($event)" >
      <label v-on:click.prevent for="addRecipe">Add Recipe To Meal</label>
  </div>
  </div>
  </div>
</template>

<script>
export default {
    name: 'recipe-card-for-meal',
    props: {
        recipe: Object
    },
    data() {
    return {
      checkedRecipes: [],
    };

  },
  computed: {
      isChecked(){
          return this.$store.state.checkedRecipes.contains(this.recipe.recipeId);
      }
  },
  methods: {
      saveChecked(event){
          if ( event.target.checked){
            this.$store.commit('SET_CHECKED', this.recipe.recipeId)
          }else {
            this.$store.commit('SET_UNCHECKED', this.recipe.recipeId)
          }
      }
  }

}
</script>

<style>
.card {
   background-color: #F7BFB4;
    border: 2px solid #5b4b49;
    border: 2px solid black;
    border-radius: 10px;
    width: 250px;
    height: 450px;
    margin: 20px;
    padding-left:6%;
    padding-right:1%;
    transition-duration: 0.4s;
     font-family: 'Arial';
    
}
.card:hover {
  box-shadow: 7px 7px 5px #23967f;
}
.card .recipe-name {
    font-size: 1.5rem;
}

.checkbox-container{
     /* align-content: center;
     align-items: center;
     justify-content: center; */
}
#RCFMI {
    min-width: 80%;
    min-height: auto;
    max-width: 90%;
    max-height: 50%;
    transition-duration: 0.4s;
}

#RCFMI:hover{
   box-shadow: 4px 4px 3px #a23e48;
}
#addRecipe {
  transition-duration: 0.4s;
}
#addRecipe:hover {
  box-shadow: 1px 2px 3px #a23e48;
}
</style>
