import axios from 'axios';

const recipeApi = new axios.create({
    baseURL: 'http://localhost:8080'
});

export default {

    getRecipes(){
        return recipeApi.get('/recipes');
    },
    getRecipe(id){
        return recipeApi.get(`/recipe/${id}`);
    },
    getRecipesByName(userId,name){
        return recipeApi.get(`/recipes/user/${userId}/${name}`);
    },
    getRecipesBySaved(userId){
        return recipeApi.get(`/recipes/user/${userId}`);
    },
    sendRecipe(recipe){
        return recipeApi.post(`/recipes`, recipe);
    },
    updateRecipe(recipe){
        return recipeApi.put(`/recipes`, recipe);
    },
    saveRecipe(recipeId,userId){
        return recipeApi.post(`/recipes/user/${userId}/${recipeId}`);
    },
    forgetRecipe(recipeId, userId){
        return recipeApi.delete(`/recipes/user/${userId}/${recipeId}`);
    },
    removeRecipe(recipeId) {
        return recipeApi.delete(`/removeRecipe/${recipeId}`)
    },
    getIngredients(planName) {
        return recipeApi.get(`/grocerieslist/${planName}`);
    },



}