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

</script>

<style scoped>
body {
            background-color: #3d87dc;
        }
        .container {
            text-align: center;
            padding: 17px 80px;
            background-image: url('~/public/images/bg.png');
            background-size: cover;
            background-repeat: no-repeat;
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