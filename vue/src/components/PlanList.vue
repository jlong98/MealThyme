<template>
  <div class="plans-list">
      <div class="plans">
        <plan-card id="plan-cards" v-for="plan in plans" v-bind:plan="plan" v-bind:key="plan.planId" />
      </div>
  </div>
</template>

<script>
import PlanCard from './PlanCard.vue'
import planService from '@/services/PlanService'

export default {
    name: "my-plans-list",
  components: { 
      PlanCard,
  },
  data() {
      return {
          plans:[]
      }
  },
  computed: {
    //   plansList() {
    //       return this.$store.state.plans;
    //   }
  },
  created() {
      planService.findPlansByUserId(this.$store.state.user.id).then(response => {
          this.$store.commit('ADD_PLANS',response.data);
          this.plans = response.data;  
      })
  }
}
</script>

<style>

</style>