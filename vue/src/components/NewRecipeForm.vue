<template>
  <form class="new-recipe-form" v-on:submit.prevent="saveRecipe">
      <input class="name-input" type="text" placeholder="Input Recipe Name" v-model="recipe.name" />
      <input class="calories-input" type="number" placeholder="Input Calories Here" v-model="recipe.calories" />
      <input class="is_low_fat" id="lowfat" type="checkbox" v-model="recipe.is_low_fat" />
      <label for="lowfat"> Is this recipe low fat? </label>
      <input class="is_low_carb" id="lowcarb" type="checkbox" v-model="recipe.is_low_carb" />
      <label for="lowcarb"> Is this recipe low carb? </label>
      <input class="is_low_sodium" id="lowsodium" type="checkbox" v-model="recipe.is_low_sodium" />
      <label for="lowsodium"> Is this recipe low sodium? </label>
      <input class="is_high_protein" id="highprotein" type="checkbox" v-model="recipe.is_high_protein" />
      <label for="highprotein"> Is this recipe high protein? </label>
      <input class="is_breakfast" id="isbreakfast" type="checkbox" v-model="recipe.is_breakfast" />
      <label for="isbreakfast"> Breakfast </label>
      <input class="is_lunch" id="islunch" type="checkbox" v-model="recipe.is_lunch" />
      <label for="islunch"> Lunch </label>
      <input class="is_dinner" id="isdinner" type="checkbox" v-model="recipe.is_dinner" />
      <label for="isdinner"> Dinner </label>
      <input class="ingredients" type="text" size="100" placeholder="Ingredients Here" />
      <input class="directions" type="text" size="150" placeholder="Please Enter Directions Here" />
      </form>
</template>

<script>
export default {
  name: "new-recipe-form",
  data() {
    return {
      recipe: {
          id: 0,
          URL: 0,
          name: '',
          ingredients: [],
          directions: '',
          calories: 0,
          is_low_fat: false,
          is_high_protein: false,
          is_low_carb: false,
          is_low_sodium: false,
          is_breakfast: false,
          is_lunch: false,
          is_dinner: false,
          saved: false,
      }
    }
  },
  methods: {
    saveRecipe() {
      this.$store.commit('SAVE_RECIPE', this.recipe);
      this.recipe = {
      id: 0,
      URL: 0,
      name: '',
      ingredients: [],
      directions: '',
      calories: 0,
      is_low_fat: false,
      is_high_protein: false,
      is_low_carb: false,
      is_low_sodium: false,
      is_breakfast: false,
      is_lunch: false,
      is_dinner: false,
      saved: false,
      };
      this.$router.push({ name: 'my-recipes' });
    }
  }
}
</script>

<style>

</style>