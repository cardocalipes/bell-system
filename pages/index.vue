<template>
    <div class="container">
        <div class="logo">
            <img src="~/public/images/logo.png" alt="BELLHUB Logo" width="300" height="300">
        </div>
        <div class="login-form">
            <h2>LOGIN</h2>
            <form action="your-login-action.php" method="POST">
                <input type="text" class="form-input" name="name" placeholder="Name" required>
                <input type="password" class="form-input" name="access_code" placeholder="Access Code" required>
                <router-link :to="{ path: '/Main-Menu/main-menu' }"><button type="submit" class="signin-btn">Sign In</button></router-link>
            </form>
        </div>
    </div>
</template>

<script setup>

</script>

<style scoped>
body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            text-align: center;
            margin-top: 100px;
        }
        .logo {
            margin-bottom: 20px;
        }
        .login-form {
            background-color: #19e36d;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        .form-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .signin-btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .signin-btn:hover {
            background-color: #0056b3;
        }
</style>