<template>
<div class ="grocery-list">
    <h1 class= "grocery">Grocery List</h1>
    <ul id= "list">
        <li v-for="grocery in groceries" v-bind:key="grocery">{{grocery}}</li>
    </ul>
</div>
</template>

<script>
import RecipeService from '@/services/RecipeService'

export default {
    name: 'groceries-list',
    data() {
        return {
            groceries: [],
        }
    },
    created() {
        RecipeService.getIngredients(this.$route.params.planName).then((response) => {
            return this.groceries = response.data.split(',');
        });
    }
}

</script>

<style>
.grocery-list{
    align-items: center;
}
.grocery{
    align-self: center;
}
#list{
    background: #F7BFB4;
   border: 2px solid #5b4b49;
   border-radius: 25px;
   width: 1900px;
   height: 1275px;
   font-size: 20px;
   font-family:'Helvetica';
   display: flex;
   flex-direction: column;
   flex-wrap: wrap;
   /* flex-grow: auto; */
   flex: 1;
   padding: 75px;
   align-self: center;
}
</style>