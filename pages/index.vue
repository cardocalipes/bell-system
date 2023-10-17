<template>
    <div class="container">
        <div class="logo">
            <img src="~/public/images/logo.png" alt="BELLHUB Logo" width="250" height="250">
        </div>
        <div class="login-form">
            <h2>LOGIN</h2>
            <form action="your-login-action.php" method="POST">
                <input type="text" class="form-input" name="name" placeholder="Name" required>
                <input type="password" class="form-input" name="access_code" placeholder="Access Code" required>
                <router-link :to="{ path: '/Main-Menu/main-menu' }">
                <button type="submit" class="signin-btn">Sign In</button></router-link>
            </form>
        </div>
    </div>
</template>

<script setup>

</script>

<style scoped>
body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }
        .container {
            text-align: center;
            margin-top: 40px;
        }
        .logo {
            margin-bottom: 20px;
        }
        .login-form {
            background-color: #b7d9ff;
            width: 50%;
            padding: 20px 10px;
            border-radius: 5px;
            margin: 0 auto;
        }
        .form-input {
            width: 50%;
            padding: 10px 20px;
            margin-bottom: 10px;
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
        }
        .signin-btn:hover {
            background-color: #0056b3;
        }
</style>