<template>
<div>
  <div class="search-bar">
    <h2>Search for recipes</h2>
    <form id = "form">
        <label for="recipeName">Search </label>
        <input
            type="text"
            id="searchBar"
            class="form-control"
            placeholder="enter name"
            v-model="searchValue"
        />
        <button v-on:click.prevent="filterBySearch()">Search</button>
    </form>
  </div>
  <recipe-list v-bind:searchValue="savedSearchValue" v-bind:key="savedSearchValue"/>
</div>
</template>

<script>
import RecipeList from '@/components/RecipeList.vue';
export default {
    components: { RecipeList },
    name: "all-recipes",
    data() {
        return {
            searchValue: '',
            savedSearchValue: ''
        }
    },
    methods: {
        filterBySearch(){
            this.savedSearchValue = this.searchValue;
        }
    }

}
</script>

<style>
.search-bar{
    font-family: 'Arial';
}
</style>