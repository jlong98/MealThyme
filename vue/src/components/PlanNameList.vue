<template>
  <div class="plans-list">
      <div class="plans">
        <plan-name-card v-for="plan in plans" v-bind:plan="plan" v-bind:key="plan.planId" />
      </div>
  </div>
</template>

<script>
import PlanNameCard from './PlanNameCard.vue'
import planService from '@/services/PlanService'

export default {
    name: "my-plans-list",
  components: { 
      PlanNameCard,
  },
  data() {
      return {
          plans:[]
      }
  },
  created() {
      planService.findPlansByUserId(this.$store.state.user.id).then(response => {
          this.plans = response.data;  
      })
  }
}
</script>

<style>
</style>