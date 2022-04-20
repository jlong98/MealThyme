import axios from 'axios';
const mealApi = new axios.create({
    baseURL: 'http://localhost:8080'
});

export default {

    findMealById(mealId){
        return mealApi.get(`/meals/${mealId}`);
    },

    findMealsByMealType(mealType){
        return mealApi.get(`/meals/mealType/${mealType}`);
    },
    findMealsByDay(mealDay){
        return mealApi.get(`/meals/mealDay/${mealDay}`);
    },
    addRecipeToAMeal(mealId, recipeId){
        return mealApi.post(`/meals/${mealId}/addRecipe/${recipeId}`, {mealId: mealId, recipeId: recipeId});
    },
    addRecipeToAMealByName(recipeName, mealId){
        return mealApi.post(`/meals/${mealId}/addRecipe/recipeName/${recipeName}`, {mealId: mealId, recipeName: recipeName});
    },
    getMeals(userId){
        return mealApi.get(`user/${userId}/meals`);
    },
    getRecipesFromMeal(mealId){
        return mealApi.get(`/meal/${mealId}/recipes`)
    },
    findMealsByPlanId(planId){
        return mealApi.get(`/plan/${planId}/meals`)
    },
    getMealsFromPlan(planId){
        return mealApi.get(`/plan/${planId}/meals`);
    },
    removeRecipeFromMeal(mealId, recipeId){
    return mealApi.delete(`/meals/${mealId}/removeRecipe/` + recipeId);
    },
    createMeal(mealType, mealDay, planId){
        return mealApi.post(`/${planId}/createMeal/${mealType}/${mealDay}`, planId, mealType, mealDay);
    }
}