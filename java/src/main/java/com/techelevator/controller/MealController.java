package com.techelevator.controller;
import com.techelevator.dao.MealDao;
import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class MealController {

        private MealDao mealDao;

        public MealController(MealDao mealDao) {
                this.mealDao = mealDao;
        }

        @PreAuthorize("permitAll")
        @RequestMapping(path = "/meals/mealId/{mealId}", method = RequestMethod.GET)
        public Meal findMealDetailsById(@PathVariable Long mealId) {
                return mealDao.findMealDetailsById(mealId);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(path = "/meals/mealType/{mealType}", method = RequestMethod.GET)
        public List<Meal> findMealsByMealType(@PathVariable String mealType) {
                return mealDao.findMealsByMealType(mealType);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(path = "/meals/mealDay/{mealDay}", method = RequestMethod.GET)
        public List<Meal> findMealsByDay(@PathVariable String mealDay) {
                return mealDao.findMealsByDay(mealDay);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(value = "/meals/{mealId}/addRecipe/{recipeId}", method = RequestMethod.POST)
        public void addRecipeToAMeal(@PathVariable Long mealId, @PathVariable Long recipeId) {
                mealDao.addRecipeToAMeal(mealId, recipeId);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(value = "/meals/{mealId}/addRecipe/recipeName/{name}", method = RequestMethod.POST)
        public void addRecipeToAMealWithName(@PathVariable String name, @PathVariable Long mealId) {
                mealDao.addRecipeToAMealWithName(name, mealId);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(path = "/user/{userId}/meals", method = RequestMethod.GET)
        public List<Meal> displayMealsByUserId(@PathVariable Long userId) {
                return mealDao.displayMealsByUserId(userId);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(path = "/plan/{id}/meals", method = RequestMethod.GET)
        public List<Meal> findMealsByPlanId(@PathVariable Long id) {
                return mealDao.findMealsByPlanId(id);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(path = "/meals/{mealId}/removeRecipe/{recipeId}", method = RequestMethod.DELETE)
        public void removeRecipeFromAMeal(@PathVariable Long mealId, @PathVariable Long recipeId) {
                mealDao.removeRecipeFromAMeal(mealId, recipeId);
        }

        @PreAuthorize("permitAll")
        @RequestMapping(value = "/{planId}/createMeal/{mealType}/{mealDay}", method = RequestMethod.POST)
        public void createMeal(@PathVariable String mealType, @PathVariable String mealDay, @PathVariable Long planId){
                mealDao.createMeal(mealType, mealDay, planId);
        }
}

