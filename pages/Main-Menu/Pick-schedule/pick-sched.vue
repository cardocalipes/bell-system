<template>
    <li class="back-button"><NuxtLink to ="/Main-Menu/main-menu">Back</NuxtLink></li>
    <div class="container">
        <h2 class="header">PICK SCHEDULE</h2>
        <div class="box" onclick="selectSchedule(1)">
            <router-link :to="{ path: '/Main-Menu/Pick-Schedule/Schedules/sched1' }"><h3>Schedule 1</h3><span class="menu-icon">&#x1F4C5;</span></router-link>       
        </div>
        <div class="box" onclick="selectSchedule(2)">
            <router-link :to="{ path: '/Main-Menu/Pick-Schedule/Schedules/sched2' }"><h3>Schedule 2</h3><span class="menu-icon">&#x1F4C5;</span></router-link>       
        </div>
        <div class="box" onclick="selectSchedule(3)">
            <router-link :to="{ path: '/Main-Menu/Pick-Schedule/Schedules/sched3' }"><h3>Schedule 3</h3><span class="menu-icon">&#x1F4C5;</span></router-link>       
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
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .header{
            text-align: center;
            margin: 0 auto;
            margin: 20px;
            padding: 20px;
            height: 50px;
        }
        .container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            height: 97.3vh;
            background-image: url('~/public/images/bg.png');
            background-size: 1260px 600px;
        }
        .box {
            text-align: center;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: transform 0.2s;
            flex: 1;
            margin: 20px;
            padding: 50px;
        }
        .box:hover {
            transform: scale(1.05);
        }
</style>