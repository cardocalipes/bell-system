<template>
  <div class="container">
    <div class="logo">
      <img src="~/public/images/logo-circle_1.png" alt="BELLHUB Logo" width="200" height="200" />
      <h2>BELLHUB</h2>
    </div>
    <div class="login-form">
      <label for="username">Username:</label>
      <input v-model="username" type="text" id="username" />

      <label for="accessCode">Access Code:</label>
      <input v-model="accessCode" type="password" id="accessCode" />

      <button @click="login">Login</button>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useHttp } from '@nuxt/http';

const username = ref ();
const accessCode = ref ();

const login = async () => {
  try {
    console.log('Sending credentials:', { username: username.value, accessCode: accessCode.value });

    const response = await useFetch('/api/login', {
      Username: username.value,
      Access_Code: accessCode.value,
    });

    console.log('Response from server:', response.data);

    if (response.data.isValid) {
      // Redirect to the Main-Menu
      this.$router.push('/Main-Menu');
    } else {
      // Display an error message
      alert('Invalid username or access code');
    }
  } catch (error) {
    console.error('Error during login:', error);
    alert('An error occurred during login. Please try again.');
  }
};
</script>

<style scoped>
/* Your styling remains unchanged */
</style>


<style scoped>
body {
            background-color: #3d87dc;
        }
        .container {
            text-align: center;
            padding: 17px 80px;
            background-image: url('~/public/images/bg.png');
            background-size: 1260px 600px;
        }
        .logo {
            color: #07053a;
            font: caption;
            font-size: 30px;
        }
        .login-form {
            background-color: #b7d9ff;
            width: 30%;
            padding: 30px 5px;
            border-radius: 5px;
            margin: 0 auto;
        }
        .form-input {
            width: 50%;
            margin-top: 5px;
            padding: 10px 20px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
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
</style>