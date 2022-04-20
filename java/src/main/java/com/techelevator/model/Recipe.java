package com.techelevator.model;

public class Recipe {

    private Long recipeId;
    private String name;
    private String ingredients;
    private String directions;
    private int calories;
    private String image;
    private Boolean isHighProtein;
    private Boolean isLowSodium;
    private Boolean isLowFat;
    private Boolean isLowCarb;
    private Boolean isBreakfast;
    private Boolean isLunch;
    private Boolean isDinner;
    private Boolean isSaved;

    public Recipe() { }

    public Recipe(Long recipeId,String ingredients,String directions,int calories,String image,Boolean isHighProtein,Boolean isLowSodium,Boolean isLowFat,Boolean isLowCarb) {
        this.recipeId = recipeId;
        this.ingredients = ingredients;
        this.directions = directions;
        this.calories = calories;
        this.image = image;
        this.isHighProtein = isHighProtein;
        this.isLowSodium = isLowSodium;
        this.isLowFat = isLowFat;
        this.isLowCarb = isLowCarb;

    }

    public Long getRecipeId() {return recipeId;}

    public void setRecipeId(Long recipeId) {this.recipeId = recipeId;}

    public String getName() {return name;}

    public void setName(String name) {this.name = name;}

    public String getIngredients() {return ingredients;}

    public void setIngredients(String ingredients) {this.ingredients = ingredients;}

    public String getDirections() {return directions;}

    public void setDirections(String directions) {this.directions = directions;}

    public int getCalories() {return calories;}

    public void setCalories(int calories) {this.calories = calories;}

    public Boolean getHighProtein() {return isHighProtein;}

    public String getImage() {return image;}

    public void setImage(String image) {this.image = image;}

    public void setHighProtein(Boolean highProtein) {isHighProtein = highProtein;}

    public Boolean getLowSodium() {return isLowSodium;}

    public void setLowSodium(Boolean lowSodium) {isLowSodium = lowSodium;}

    public Boolean getLowFat() {return isLowFat;}

    public void setLowFat(Boolean lowFat) {isLowFat = lowFat;}

    public Boolean getLowCarb() {return isLowCarb;}

    public void setLowCarb(Boolean lowCarb) {isLowCarb = lowCarb;}

    public Boolean getBreakfast() {return isBreakfast;}

    public void setBreakfast(Boolean breakfast) {isBreakfast = breakfast;}

    public Boolean getLunch() {return isLunch;}

    public void setLunch(Boolean lunch) {isLunch = lunch;}

    public Boolean getDinner() {return isDinner;}

    public void setDinner(Boolean dinner) {isDinner = dinner;}

    public Boolean getSaved(){return this.isSaved;}

    public void setSaved(Boolean saved){isSaved = saved;}
}
