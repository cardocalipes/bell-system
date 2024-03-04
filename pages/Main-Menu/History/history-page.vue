<template>
    <div class="container">
        <li class="back-button"><NuxtLink to ="/Main-Menu/main-menu">Back</NuxtLink></li>
        <div class="header">
            <h1>HISTORY</h1>
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
        .container{
            background-repeat: no-repeat;
            background-image: url('~/public/images/bg.png');
            height: 98vh;
            background-size: 1530px 850px;
        }
        .header {
            text-align: center;
            padding: 27px 0 0 0;
            background-color: none;
            font: caption;
            font-weight: bold;
            font-size: 25px;
            color: #07053a;
        }
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 20px 20px;
            cursor: pointer;
            font: caption;
            font-size: 20px;
        }
</style>