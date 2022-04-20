<template>
  <div class="meal-card" v-bind:key="meal.id">
      <!-- <router-link v-bind:to="{name: 'meal', params: {id : meal.mealId}}"> -->
       <h1 class="meal-day">{{meal.mealDay}}</h1>
      <!-- </router-link> -->
      <div class= "add-recipe">
          <div class="meal-type">
      <h2 >{{meal.mealType}}</h2>
          </div>
      <form v-on:submit.prevent="addRecipe">
      <router-link v-bind:to="{name: 'recipe-list-for-meals', params: {planId: planId,  id : meal.mealId}}">
           <button id="add" ><font-awesome-icon icon="fa-solid fa-plus" />Add</button></router-link>
      </form>
      </div>
      <div class = "recipe" v-for="recipe in recipes" v-bind:recipe="recipe" v-bind:key="recipe.recipeId">
        <router-link v-bind:to="{name: 'recipe', params: {id: recipe.recipeId}}"><h3>{{recipe.name}}</h3></router-link>
        <button id="remove" v-on:click.prevent="remove(meal.mealId, recipe.recipeId)"><font-awesome-icon icon="fa-solid fa-xmark" /></button>
        </div>
  </div>
</template>

<script>
import MealService from '@/services/MealService';
export default {
    name: 'meal-card',
    components: {
    },
    props: {
        meal: Object,
        planId: Number
    },
    data(){
        return {
            isDeleted: false,
            recipes:[],
        }
    },
    created() {
        const id = this.meal.mealId
        MealService.getRecipesFromMeal(id).then(response => {
            this.$store.commit('ADD_RECIPES', response.data)
            this.recipes = response.data;
        })
    },
      methods:{
        remove(mealId, recipeId){
            this.isDeleted = !this.isDeleted;
            MealService.removeRecipeFromMeal(mealId, recipeId).then(resp =>{
                if (resp.status === 200 || resp.status === 204){
                    this.$emit("deleteMeal",this.isDeleted);
                    this.$store.commit('TOUCH_MEAL', this.meal);
                }
            })
        }
    },
    
}
</script>

<style>
.meal-card {
    background-color: #F7BFB4;
    border: 2px solid #5b4b49;
    display: flex;
    flex-direction: column;
    flex-basis: content;
    flex-grow: auto;
    font-family: 'Arial';
    border-radius: 10px;
    width: 275px;
    height: 275px;
    margin: 10px;
    margin-block: 15px;
    font-size: 14px;
    padding: 5px;
     transition-duration: 0.4s; 
    
}
.meal-card:hover {
     box-shadow: 7px 7px 5px #23967f;
}
.meal-day{
     margin-bottom: -5px;
}
.add-recipe{
    display:flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    /* padding-block: 4px; */
}
.meal-type{
    display: inline;
    align-self: top;
    margin-bottom: -5px;
}
#add {
    background-color: #db93b0;
    color: white;
    border-color: #db93b0;
    font-size: 18px; 
    transition-duration: 0.4s; 
}
#add:hover {
     box-shadow: 2px 2px 1px #a23e48;
}
#remove {
  background-color: #a23e48;
  color: black;
  border-color: black;
  border-width: 1px;
  font-size: 12px; 
   transition-duration: 0.4s; 
}
#remove:hover{
box-shadow: 2px 2px 1px #a23e48;
}
.recipe{
    display: flex;
    flex-wrap: wrap;
    padding: 10px;
    margin-bottom: -25px;
    margin-top:-25px;
    align-items: center;
    justify-items: center;
}
</style>