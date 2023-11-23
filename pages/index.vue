<template>
  <div class="container">
    <div class="logo">
      <img src="~/public/images/logo-circle_1.png" alt="BELLHUB Logo" width="200" height="200" />
      <h2>BELLHUB</h2>
    </div>
    <div class="login-form">
      <label class="label" for="username">Username: </label>
      <input class="un" v-model="username" type="text" id="username" />

      <label class="label" for="accessCode"> <br> Access Code: </label>
      <input class="ac" v-model="accessCode" type="password" id="accessCode" />

      <button @click="login()">Login</button>
    </div>
  </div>
</template>

<script setup>
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


</script>


<style scoped>
body {
            background-color: #3d87dc;
      }
        .label {
            color: #07053a;
            font: caption;
            font-size: 13px;
        }
        .un {
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .ac {
            margin-bottom: 15px;
        }
        .container {
            text-align: center;
            padding: 80px;
            background-image: url('~/public/images/bg.png');
            background-size: 100%;
            background-repeat: no-repeat;
            height: 543px;
        }
        .logo {
            color: #07053a;
            font: caption;
            font-size: 30px;
        }
        .login-form {
            background-color: #b7d9ff;
            width: 25%;
            padding: 25px 15px;
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
</style>