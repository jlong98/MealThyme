<template>
  <div class="my-plans">
    <div class ="title-button">
    <h1 class="title">My Plans</h1>
    <div class="button-container">
      <button id="add" v-show='toggle' v-on:click='toggle = !toggle'>Add a Plan</button>
      <form v-on:submit.prevent="createPlan">
      <input v-show="!toggle" v-model="planName" type="text" placeholder="Add plan name" />
      <button v-show="!toggle" type="submit"  >Submit</button>
      </form>
      </div>
      <div class = "plan-list">
      <plan-list :key="this.version"/>
      </div>
  </div>
  </div>
</template>

<script>
import PlanList from '../components/PlanList.vue';
import planService from '../services/PlanService.js';
export default {
  components: { PlanList },
  name: "my-plans",
  data() {
    return {
      toggle: true,
      planName: '',
      savedName: '',
      version: 0
    }
  },
  methods: {
    createPlan(){
      // const planName = this.plan.planName;
      this.savedName = this.planName
      planService.createPlanForUser(this.$store.state.user.id, this.savedName).then(()=>{
        this.version++
      })
      this.toggle = true;
      this.planName = "";
    }  
  }  
};
</script>

<style>
.my-plans {
  /* background-color:#7daf9c; */
  font-family: 'Arial';
    /* display: flex;
    flex-direction: column;
    justify-content: center;
    flex-wrap: wrap; */
}
.title-button{
  display:flex;
  flex-direction: column;
  justify-content: center;
  gap: 30px;
}
.title{
  display:flex;
  justify-content: center;
}
.button-container{
  
  display: flex;
  justify-content: center;
}
.plan-list {
 display: flex;
 justify-content: center;
}

</style>