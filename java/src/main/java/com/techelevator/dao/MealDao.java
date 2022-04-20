package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Date;
import java.util.List;

public interface MealDao {

    Meal findMealDetailsById(Long mealId);

    List <Meal> findMealsByDay(String mealDay);

    List <Meal> findMealsByMealType(String mealType);

    void addRecipeToAMeal(Long mealId, Long recipeId);

    void addRecipeToAMealWithName(String name, Long mealId);

    List<Meal> displayMealsByUserId(Long userId);

    List<Meal> findMealsByPlanId(Long planId);

    void removeRecipeFromAMeal(Long mealId, Long recipeId);

    void createMeal(String mealType, String mealDay, Long planId);

}
