import axios from 'axios';
const planApi = new axios.create({
    baseURL: 'http://localhost:8080'
});

export default {

    findPlanById(planId){
        return planApi.get(`/plans/${planId}`);
    },

    findPlansByUserId(userId){
        return planApi.get(`/user/${userId}/plans`);
    },
    
    createPlanForUser(userId, planName){
        return planApi.post(`/${userId}/plan`, {planName: planName });
    }
}
