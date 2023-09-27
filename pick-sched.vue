<template>
    <li class="back-button"><NuxtLink to ="/Main-Menu/main-menu">Back</NuxtLink></li>
    <div class="header">
        PICK SCHEDULE
    </div>
    <div class="container">
        <div class="box" onclick="selectSchedule(1)">
            <h3>Schedule 1</h3>
        </div>
        <div class="box" onclick="selectSchedule(2)">
            <h3>Schedule 2</h3>
        </div>
        <div class="box" onclick="selectSchedule(3)">
            <h3>Schedule 3</h3>
        </div>
    </div>
</template>

<script setup>

</script>

<style scoped>
body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .header {
            text-align: center;
            padding: 20px;
            background-color: #007bff;
            color: #fff;
            font-size: 24px;
        }
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            height: 100vh;
        }
        .box {
            text-align: center;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: transform 0.2s;
            flex: 1;
            margin: 10px;
        }
        .box:hover {
            transform: scale(1.1);
        }
</style>