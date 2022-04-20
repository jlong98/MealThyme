<template>
<div id="background">
  <saved-recipes-list :key="this.version"/>
</div>
</template>

<script>
import SavedRecipesList from '../components/SavedRecipesList.vue'
export default {
  name: "saved-recipes",
  components: { SavedRecipesList },
  data() {
    return {
      version: 0
    }
  }

}
</script>

<style>

</style>