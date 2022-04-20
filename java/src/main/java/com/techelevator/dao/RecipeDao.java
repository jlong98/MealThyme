package com.techelevator.dao;

import com.techelevator.model.Recipe;

import java.util.List;

public interface RecipeDao {

    List<Recipe> findAll();

    Recipe findRecipeById(Long recipeId);

    List<Recipe> findRecipeByName(Long userId, String name);

    List<Recipe> findRecipesByCalorieCount(int calories);

    List<Recipe> findRecipesByType(String type);

    List<Recipe> displayRecipesInMeal(Long mealId);

    void updateRecipe(Recipe recipe);

    List<Recipe> findRecipesBySaved(Long userId);

    void addSavedRecipe(Long recipeId,Long userId);

    void deleteSavedRecipe(Long userId, Long recipeId);

    String getIngredientsByPlanName(String planName);
}
