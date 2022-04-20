<template>
  <div class="home">
    <div class="container">
      <h1 class="homeTitle">MealThyme<img class="carrot" :src="require(`@/images/justcarrot.png`)" />    
      </h1>
    </div>
    <div class="router-links">
      <router-link class="my-recipes" v-bind:to="{ name: 'my-recipes' }" v-if="$store.state.token != ''">My<br>Recipes<br><br><img class="recipes" :src="require(`@/images/recipesbrown.png`)" /></router-link>
      <router-link class="my-plans-home" v-bind:to="{ name: 'my-plans'}" v-if="$store.state.token != ''">My<br>Plans<br><br><img class="calendar" :src="require(`@/images/calendar.png`)" /></router-link>
      <router-link class="groceries" v-bind:to="{name: 'groceries-list'}" v-if="$store.state.token != ''">Grocery<br>Lists<br><br><img class="grocery-list" :src="require(`@/images/grocerylist.png`)" /></router-link>
    </div>
  </div>
</template>
  
<script>
export default {
  name: "home",
};
</script>
<style>

  .router-links {
    display: flex;
    text-align: center;
    
  }
      /* background-color:#7daf9c; */

  .my-recipes{
    text-decoration: none;
    font-weight: 600;
    font-size: 400%;
    -webkit-text-stroke: 2px #82C590;
    -webkit-text-fill-color: #5b4b49;
    padding: 5%;
    margin: 5%;
    /* background-color:#23967f; */
    border-radius: 100px;
    height: 10%;
    width: 10%;
    border: 10px solid #5b4b49;
    transition-duration: 0.4s; 
  }
  .my-plans-home{
   text-decoration: none;
    font-weight: 600;
    font-size: 400%;
    -webkit-text-stroke: 2px #82C590;
    -webkit-text-fill-color: #5b4b49;
    padding: 5%;
    margin: 5%;
    /* background-color:#23967f; */
    border-radius: 100px;
    height: 10%;
    width: 10%;
    border: 10px solid #5b4b49;
    transition-duration: 0.4s; 
  }
  .groceries {
   text-decoration: none;
    font-weight: 600;
    font-size: 400%;
    -webkit-text-stroke: 2px #82C590;
    -webkit-text-fill-color: #5b4b49;
    padding: 5%;
    margin: 5%;
    /* background-color:#23967f; */
    border-radius: 100px;
    height: 10%;
    width: 10%;
    border: 10px solid #5b4b49;
    transition-duration: 0.4s; 
  }
  .my-recipes:hover{
    box-shadow: 20px 20px 7px #82C590;
}
  .my-plans-home:hover{
box-shadow: 20px 20px 7px #82C590;}

  .groceries:hover{
box-shadow: 20px 20px 7px #82C590;}

  .my-recipes .recipes{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 25%;
    width: 50%;
  }
  .my-plans-home .calendar{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 25%;
    width: 50%;
  }
  .groceries .grocery-list{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 25%;
    width: 50%;
  }
  
  
  .homeTitle{
    margin: auto;
    width: 50%;
    text-justify: center;
    text-align: center;
    font-size: 9rem;
    -webkit-text-stroke: 2px #82C590;
    -webkit-text-fill-color: #5b4b49;
  }

  .carrot {
    justify-self: center;
    align-self: center;
    max-width: 15%;
    max-height: 15%;
  }

   .home{
    font-family: 'Arial';
    /* display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: 
    20%
    40%
    40%; */
    /* grid-template-areas:
      "container container ." 
      "routerlinks routerlinks routerlinks"
      "routerlinks routerlinks routerlinks" */
  }

  .router-links {
    display: flex;
    align-content: space-evenly;
    justify-content: space-between;
  }

</style>