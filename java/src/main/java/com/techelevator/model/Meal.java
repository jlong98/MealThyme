package com.techelevator.model;

public class Meal {
    private Long mealId;
    private String mealType;
    private String mealDay;
    private Integer version = 0;


    public String getMealType() {
        return mealType;
    }

    public void setMealType(String mealType) {
        this.mealType = mealType;
    }

    public String getMealDay() {
        return mealDay;
    }

    public void setMealDay(String mealDay) {
        this.mealDay = mealDay;
    }
    public Long getMealId() {
        return mealId;
    }

    public void setMealId(Long mealId) {
        this.mealId = mealId;
    }

    public Integer getVersion(){return version;}

    public void setVersion(Integer version) {this.version = version;}
}
