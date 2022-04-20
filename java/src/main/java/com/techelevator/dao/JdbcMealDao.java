package com.techelevator.dao;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcMealDao implements MealDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcMealDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Meal findMealDetailsById(Long mealId) {
        Meal meal = null;
        String sql = "SELECT * FROM meals WHERE meal_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, mealId);
        if (results.next()) {
            meal = mapRowToMeal(results);
        }
        return meal;
    }

    @Override
    public List<Meal> findMealsByDay(String mealDay) {
        List <Meal> mealList = new ArrayList<>();
        String sql = "SELECT * FROM meals WHERE day_of_week = ?;";
        SqlRowSet mealDetails = jdbcTemplate.queryForRowSet(sql, mealDay);
        while (mealDetails.next()){
            Meal meal = mapRowToMeal(mealDetails);
            mealList.add(meal);
        }
        return mealList;
    }

    @Override
    public List<Meal> findMealsByMealType(String mealType) {
        List <Meal> meals = new ArrayList<>();
        String sql = "SELECT * FROM meals WHERE type_of_meal = ?;";
        SqlRowSet mealResults = jdbcTemplate.queryForRowSet(sql, mealType);
        while (mealResults.next()){
            Meal meal =mapRowToMeal(mealResults);
            meals.add(meal);
        }
        return meals;
    }

    public void addRecipeToAMeal(Long mealId, Long recipeId) {
        String sql = "INSERT INTO meal_recipe VALUES(? ,?);";
        try {
            jdbcTemplate.update(sql, mealId, recipeId);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        System.out.println("Meal updated with a recipe");

    }

    public void addRecipeToAMealWithName(String name, Long mealId){
        String recipeName ="%" + name+ "%";
        String sql = "SELECT recipe_id FROM recipes WHERE recipe_name ILIKE ?";
        Long newRecipeId = null;
        try{
            newRecipeId = jdbcTemplate.queryForObject(sql, Long.class, name);
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }

        sql = "INSERT INTO meal_recipe VALUES(? ,?);";
        try {
            jdbcTemplate.update(sql, mealId, newRecipeId);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        System.out.println("Meal updated with a recipe");
    }


    public List<Meal> displayMealsByUserId(Long userId){
        List <Meal> mealsInPlan = new ArrayList<>();
        String sql = "SELECT * FROM meals m \n" +
                "JOIN meal_plan mp ON m.meal_id = mp.meal_id \n" +
                "JOIN plans p ON p.plan_id = mp.plan_id\n" +
                "JOIN user_plan up ON up.plan_id = p.plan_id\n" +
                "WHERE up.user_id = ?;";
        SqlRowSet mealsResult = jdbcTemplate.queryForRowSet(sql, userId);
        while(mealsResult.next()) {
            Meal meals= mapRowToMeal(mealsResult);
            mealsInPlan.add(meals);
        }
        return mealsInPlan;
    }

    public List<Meal> findMealsByPlanId(Long planId){
        List <Meal> mealsInPlan = new ArrayList<>();
        String sql = "SELECT * FROM meals m \n" +
                "JOIN meal_plan mp ON m.meal_id = mp.meal_id \n" +
                "WHERE mp.plan_id = ?;";
        SqlRowSet mealsResult = jdbcTemplate.queryForRowSet(sql, planId);
        while(mealsResult.next()) {
            Meal meals= mapRowToMeal(mealsResult);
            mealsInPlan.add(meals);
        }
        return mealsInPlan;
    }

    @Override
    public void removeRecipeFromAMeal(Long mealId, Long recipeId) {
            String sql = "DELETE FROM meal_recipe WHERE meal_id = ? AND recipe_id = ?;";
            jdbcTemplate.update(sql, mealId, recipeId);
    }

    @Override
    public void createMeal(String mealType, String mealDay, Long planId) {
        String sql = "INSERT INTO meals VALUES (DEFAULT, ?, ?) RETURNING meal_id;";
        Long newMealId = jdbcTemplate.queryForObject(sql, Long.class, mealType, mealDay);

        String sqlNew = "INSERT INTO meal_plan values(?, ?);";
        try {
            jdbcTemplate.update(sqlNew, newMealId, planId);
        } catch (DataAccessException e) {
        }
    }

    private Meal mapRowToMeal(SqlRowSet mealSet) {
        Meal meal = new Meal();
        meal.setMealId(mealSet.getLong("meal_id"));
        meal.setMealType(mealSet.getString("type_of_meal"));
        meal.setMealDay(mealSet.getString("day_of_week"));

        return meal;
    }

}
