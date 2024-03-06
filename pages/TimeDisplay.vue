<template>
  <div class="container">
    <div class="date-time">
      <p>{{ currentDateTime }}</p>
    </div>
    <div class="logo">
      <img src="~/public/images/logo-circle_1.png" alt="BELLHUB Logo" width="200" height="200" />
      <h2>BELLHUB</h2>
    </div>
    <div class="login-form">
      <!-- Your existing form elements -->
      <label class="label" for="username">Username: </label>
      <input class="un" v-model="username" type="text" id="username" />

      <label class="label" for="accessCode"> <br> Access Code: </label>
      <input class="ac" v-model="accessCode" type="password" id="accessCode" />

      <button @click="login()">Login</button>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { DateTime } from 'luxon';

const username = ref();
const accessCode = ref();

async function login() {
  // Your login function
}

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
/* Your existing styles */
/* ... */
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
            text-align: center;
            padding: 120px;
            background-image: url('~/public/images/bg.png');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            margin: 0 auto;
        }
        .logo {
            color: #07053a;
            font: caption;
            font-size: 30px;
        }
        .login-form {
            background-color: #b7d9ff;
            width: 23%;
            height: 20%;
            padding: 25px 100px;
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
.date-time {
  position: absolute;
  top: 20px;
  right: 20px;
  color: #000000;
  font-size: 14px;
  font-weight: bold;
}
</style>
