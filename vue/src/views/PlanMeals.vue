<template>
  <div class="my-plans">
    <h1>Plan Meals</h1>
    <div class ="meal-cards">
    <plan-details/> 
    </div> 
  </div>
</template>

<script>
import PlanDetails from '../components/PlanDetails.vue';
export default {
  components: { PlanDetails },
  name: "my-plans",
  data() {
    return {
      searchValue: ''
    }
  },
  
};
</script>

<style>
.my-plans {
  display: flex;
  justify-content: center;
  flex-direction: column;
}
h1{
display: flex;
    justify-content: center;
}
/* .meal-cards{
  display: flex;
  justify-content: center;
}  */
</style>