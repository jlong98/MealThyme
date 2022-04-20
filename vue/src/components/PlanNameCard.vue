<template>
<div>
  <div class="plan-card" v-bind:key="plan.planId">
    <router-link :to="{name: 'shopping-list', params: {planName : plan.planName}}">
    <h2 class="plan-name" v-on:click="setCurrentPlanName"> {{ plan.planName }}</h2>
    </router-link>
  </div>
  </div>
</template>

<script>

export default {
    name: 'plan-card',
    props: {
        plan: Object
    },
    methods: {
        setCurrentPlanName(){
            this.$store.commit('SET_CURRENTPLAN',this.plan.planName);
        }
    }
}
</script>

<style>
.plan-card {
    border: 2px solid #5b4b49;
    border-radius: 10px;
    width: 500px;
    height: 100px;
    margin: 20px;
    
}
.plan-card .plan-name {
    font-size: 3rem;
}

</style>