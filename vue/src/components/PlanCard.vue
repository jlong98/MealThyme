<template>
<div>
  <div class="plan-card" v-bind:key="plan.planId">
<router-link id="link" v-bind:to="{name: 'plan', params: {id : plan.planId}}">
    <h2 class="plan-name"> {{ plan.planName }}</h2>
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
    // methods: {
    // }

}
</script>

<style>
.plan-card {
    background-color: #F7BFB4;
    border: 2px solid #5b4b49;
    border-radius: 10px;
    width: 500px;
    height: 100px;
    margin: 20px;
    padding-bottom: 10px;
    text-align: center;
     transition-duration: 0.4s; 
     
}
.plan-card:hover {
  box-shadow: 7px 7px 5px #23967f;
}
.plan-card .plan-name {
   font-family: 'Arial';
    font-size: 3rem;
    
}    
#link {
    text-decoration: none;
    color:#5b4b49;
}


</style>