<template>
  <div class="container">
    <div class="time">
      <p>{{ currentDateTime }}</p>
    </div>
    <div class="logo">
      <img src="~/public/images/logo-circle_1.png" alt="BELLHUB Logo" width="250" height="250" />
      <h2>BELLHUB</h2>
    </div>

    <div class="login-form">
      <form @submit.prevent="login">
        <label class="label" for="username">Username: </label>
        <input class="un" v-model="email" type="email" placeholder="Email" required />
        <label class="label" for="accessCode"> <br> Access Code: </label>
        <input class="ac" v-model="password" type="password" placeholder="Password" required />
        <button type="submit">Login</button>
      </form>
    </div>

<!--
    <div class="login-form">
      <label class="label" for="username">Username: </label>
      <input class="un" v-model="username" type="text" id="username" required />

      <label class="label" for="accessCode"> <br> Access Code: </label>
      <input class="ac" v-model="accessCode" type="password" id="accessCode" required />

      <button @click="login()">Login</button>
    </div>
  -->

  </div>
</template>

<script setup>

  export default {
    data() {
      return {
        email: '',
        password: ''
      };
    },
    methods: {
      async login() {
        try {
          await this.$auth.loginWith('local', {
            data: { email: this.email, password: this.password }
          });
        } catch (error) {
          console.error(error);
        }
      }
    }
  };

/*
const username = ref();
const accessCode = ref();

async function login() {
  const {data: { value: authRequest } } = await useFetch("/api/login", {
  method: "POST",
  body: {
    username: username.value,
    accessCode: accessCode.value
  }
})

console.log(authRequest);

}
*/

import { ref, onMounted } from 'vue';
import { DateTime } from 'luxon';

const currentDateTime = ref('');

onMounted(() => {
  // Update date and time every second
  setInterval(updateDateTime, 1000);
  // Initial update
  updateDateTime();
});

function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('yyyy-MM-dd HH:mm:ss');
  currentDateTime.value = formattedDateTime;
}
</script>


<style scoped>
body {
            background-color: #3d87dc;
      }
        .label {
            color: #07053a;
            font: caption;
            font-size: 13px;
            font-weight: bold;
        }
        .un {
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .ac {
            margin-bottom: 15px;
        }
        .container {
            padding-top: 50px;
            text-align: center;
            background-image: url('~/public/images/bg.png');
            background-size: cover;
            background-position: center;
            height: 100vh;
            background-repeat: no-repeat;
        }
        .logo {
            color: #07053a;
            font: caption;
            font-size: 40px;
        }
        .login-form {
            background-color: #b7d9ff;
            width: 20%;
            height: 20%;
            padding: 50px 100px 10px 100px;
            border-radius: 5px;
            margin: 0 auto;
        }
        .form-input {
            width: 50%;
            margin-top: 5px;
            padding: 10px 20px;
            margin-bottom: 20px;
            border: 1px solid #000000;
            border-radius: 3px;
        }
        .signin-btn {
            background-color: #4466fc;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
            text-decoration: none;
        }
        .signin-btn:hover {
            background-color: #0056b3;
        }
        .time {
          position: absolute;
          top: 20px;
          right: 20px;
          color: #000000;
          font-size: 20px;
          font-weight: bold;
          font: caption;
        }
</style>