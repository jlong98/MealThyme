<template>
  
  <div id="register" class="text-center">
    <img id="registerlogo" :src="require(`@/images/emptycarrot.png`)" />
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
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
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required
        />
      </div>
      <div id='link'>
        <router-link  :to="{ name: 'login' }">Have an account?</router-link>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';


export default {
  name: 'register',
  data() {
    return {
      // logo:require("VUE/images/emptycarrot.png") ,
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style>

#register{
  
  max-width: 30%;
  border-color: #5b4b49;
  border-style: solid;
  border-width: 2px;
  border-radius: 100px;
  background-color: #F7BFB4;
  margin: 20%;
  padding: 10%;
  font-family: 'Arial';
  text-align: center;
}
#link{
  padding-bottom: 10px;
}
#confirmPassword{
  margin-top: 10px;
  margin-left: 78px;
}
#password {
  margin-left: 3px;
}
#registerlogo {
  width: 25%;
}
#link:hover {
  color:black;
}

</style>
