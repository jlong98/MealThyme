package com.techelevator.controller;

import com.techelevator.dao.RecipeDao;
import com.techelevator.model.Recipe;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@PreAuthorize("permitAll()")
@CrossOrigin
public class RecipeController {

    private RecipeDao recipeDao;

    public RecipeController(RecipeDao recipeDao){this.recipeDao = recipeDao;}

    @RequestMapping(path = "/recipes", method = RequestMethod.GET)
    public List<Recipe> getAllRecipes(){
        return recipeDao.findAll();
    }

    @RequestMapping(path = "/recipe/{recipeId}", method = RequestMethod.GET)
    public Recipe getRecipeById(@PathVariable String recipeId){
        Long recipeIdd = Long.parseLong(recipeId);
        return recipeDao.findRecipeById(recipeIdd);
    }

    @RequestMapping(path = "/recipes/user/{userId}/{recipeName}", method = RequestMethod.GET)
    public List<Recipe> getRecipesByName(@PathVariable Long userId, @PathVariable String recipeName){
        return recipeDao.findRecipeByName(userId, recipeName);
    }

    @RequestMapping(path = "/recipes/calories/{calories}", method = RequestMethod.GET)
    public List<Recipe> getRecipesByCalorieCount(@PathVariable int calories){
        return recipeDao.findRecipesByCalorieCount(calories);
    }

    @RequestMapping(path = "/recipes/type/{type}", method = RequestMethod.GET)
    public List<Recipe> getRecipesByType(@PathVariable String type){
        return recipeDao.findRecipesByType(type);
    }

    @RequestMapping(path = "/meal/{mealId}/recipes", method = RequestMethod.GET)
    public List <Recipe> displayRecipesInMeal(@PathVariable Long mealId){
        return recipeDao.displayRecipesInMeal(mealId);
    }

    @RequestMapping(path = "/recipes", method = RequestMethod.POST)
    public void updateRecipe(@RequestBody Recipe recipe){
        recipeDao.updateRecipe(recipe);
    }

    @RequestMapping(path = "/removeRecipe/{recipeId}", method = RequestMethod.DELETE)
    public void removeRecipe(@PathVariable Long recipeId) {
        recipeDao.removeRecipe(recipeId);
    }

    @RequestMapping(path = "recipes/user/{userId}/{recipeId}", method = RequestMethod.POST)
    public void addSavedRecipe(@PathVariable Long recipeId,@PathVariable Long userId){
        recipeDao.addSavedRecipe(recipeId,userId);
    }

    @RequestMapping(path = "recipes/user/{userId}/{recipeId}", method = RequestMethod.DELETE)
    public void deleteSavedRecipe(@PathVariable Long userId,@PathVariable Long recipeId){
        recipeDao.deleteSavedRecipe(userId,recipeId);
    }

    @RequestMapping(path = "recipes/user/{userId}", method = RequestMethod.GET)
    public List<Recipe> getRecipesBySaved(@PathVariable Long userId){
        return recipeDao.findRecipesBySaved(userId);
    }

    @RequestMapping(path = "/grocerieslist/{planName}", method = RequestMethod.GET)
    public String getIngredientsByPlanName(@PathVariable String planName){
        return recipeDao.getIngredientsByPlanName(planName);
    }

}
