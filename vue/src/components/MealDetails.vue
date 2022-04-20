<template>
  <div class="meal-detail">
      <h2 class="meal-day">{{meal.mealDay}}</h2>
      <h2 class="meal-type">{{meal.mealType}}</h2>
  </div>
</template>

<script>
import MealService from '@/services/MealService';
export default {
    name: "meal-details",
    props: {
        mealId : Number
    },
    data(){
        return {
        meal:{
          mealDay: '',
          mealType: ''
        }
    }    
    },
    created() {
      MealService.findMealById(this.$route.params.id).then(response => {
        this.meal = response.data;
      });
    }  
}
</script>

<style>

</style>