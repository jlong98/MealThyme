<template>
<div id="container">
  
  <div id="login" class="text-center">
    <img id="carrot" :src="require(`@/images/emptycarrot.png`)" />
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <div class="usernameSection">
        <label for="username" class="sr-only">Username </label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        />
      </div>
      <div class="passwordSection">
        <label for="password" class="sr-only">Password </label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        />
      </div>
      <div class="needAccountButton">
        <router-link :to="{ name: 'register' }">Need an account?</router-link>
      </div>
      <div class="submitButton">
        <button type="submit">Sign in</button>
      </div>
    </form>
  </div>
</div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style>
#container {
  background-color:#7daf9c;
  padding: 10%;
}
#login{
  border-radius: 100px;
  background-color: #F7BFB4;
  border: 2px solid #5b4b49;
  margin: 20%;
  padding: 10%;
  font-family: 'Arial';
  text-align: center;
}

.usernameSection {
  padding: 5%;
  
}

.passwordSection {
  padding-bottom: 5%;
}
.needAccountButton{
  padding-bottom: 3%;
  
}
.needAccountButton:hover {
  color: black;
}
.submitButton{
  border-radius: 5px;
  border-color: black;
}
#carrot {
  width: 25%;
}
</style>