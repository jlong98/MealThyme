<template>
  <div id="app">
    <div id="nav">
      <router-link id='home-link' v-bind:to="{ name: 'home' }" v-if="$store.state.token != ''"><img  class="homeIcon" :src="require(`@/images/home.png`)" />HOME</router-link>
      <router-link id='recipe-link' v-bind:to="{ name: 'all-recipes'}" v-if="$store.state.token != ''"><img class="recipesIcon" :src="require(`@/images/recipes.png`)" />FIND RECIPES</router-link>
      <router-link id='plans-link' v-bind:to="{ name: 'my-plans'}" v-if="$store.state.token != ''"><img class="calendarIcon" :src="require(`@/images/calendar.png`)" />PLANS</router-link>
      <router-link id='logout-link' v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"><img class="logoutIcon" :src="require(`@/images/logout.png`)" />LOGOUT</router-link>


    </div>
    <router-view />
  </div>
</template>

<style>

#nav {
   font-family: 'Arial';
   top: 0;
   height: 50px;
   width: auto;
   z-index: 1000;
   display: flex;
   position: sticky;
   justify-content:  space-evenly;
   align-items: center;

   background-color: #f7bfb4;
    border-bottom: 2px solid #5b4b49;
 

}

 /* #nav:hover {
  background-color: #5b4b49;
  color: #f7bfb4;

}  */
.homeIcon{
    display: inline-block;
    vertical-align: bottom;
    padding-right: 4px;
    margin-left: auto;
    margin-right: auto;
    height: 20px;
    width: 20px;
    
  }
 
  #home-link {
    color: #5b4b49;
  }
  #home-link:hover {
    text-shadow: 1px 1px black;
   
  }
  
  .recipesIcon{
   display: inline-block;
    vertical-align: bottom;
    padding-right: 4px;
    margin-left: auto;
    margin-right: auto;
    height: 20px;
    width: 20px;
    
  }
  #recipe-link{
    color: #5b4b49;
  }
   #recipe-link:hover{
     text-shadow: 1px 1px black;
   }
  .calendarIcon{
    display: inline-block;
    vertical-align: bottom;
    padding-right: 4px;
    margin-left: auto;
    margin-right: auto;
    height: 20px;
    width: 20px;
  }
  #plans-link{
    color: #5b4b49;
  }
  #plans-link:hover{
    text-shadow: 1px 1px black;
  }
  .logoutIcon{
    display: inline-block;
    vertical-align: bottom;
    padding-right: 4px;
    margin-left: auto;
    margin-right: auto;
    height: 20px;
    width: 20px;
  }
  #logout-link {
    color: #5b4b49;
  }
  #logout-link:hover{
    text-shadow: 1px 1px black;
  }

</style>
