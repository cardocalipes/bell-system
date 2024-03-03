<template>
    <div class="container">
        <div class="hc">
            <h1 class="header">PICK SCHEDULE</h1>
        </div>
        <div class="scontainer">
            <li class="back-button"><NuxtLink to ="/Main-Menu/main-menu">Back</NuxtLink></li>
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
            margin: 50px 0 0 0;
            font: caption;
            font-size: 50px;
            font-weight: bold;
            color: #07053a;
        }
        .container {
            background-repeat: no-repeat;
            background-image: url('~/public/images/bg.png');
            height: 98vh;
            background-size: 1530px 850px;
        }
        .box {
            text-align: center;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: transform 0.2s;
            flex: 1;
            font: caption;
            font-size: 15px;
            margin: 20px 500px;
            padding: 30px 0 50px 0;
        }
        .scontainer{
            padding: 20px;
        }
        .box:hover {
            transform: scale(1.05);
        }
        .menu-icon{
            font-size: 45px;
        }
        .hc{
            text-align: center;
            padding: 10px;
            background-color: none;
            font: caption;
            font-weight: bold;
            font-size: 25px;
            color: #07053a;
        }
</style>