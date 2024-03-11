<template>
    <div class="container">
        <div class="time">
        <p>{{ currentDateTime }}</p>
        </div>
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
import { ref, onMounted } from 'vue';
import { DateTime } from 'luxon';

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
            padding: 20px 20px;
            cursor: pointer;
            font: caption;
            font-size: 20px;
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
            background-image: url('~/public/images/bg.png');
            background-size: cover;
            background-position: center;
            height: 100vh;
             background-repeat: no-repeat;
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
            display: inline-block;
            width: 350px;
            padding: 60px 0 80px 0;
            margin: 150px 50px 0 50px;
        }
        .scontainer{
            padding: 20px;
            text-align: center;
        }
        .box:hover {
            transform: scale(1.05);
        }
        .menu-icon{
            font-size: 80px;
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
        .time {
          position: absolute;
          top: 20px;
          right: 20px;
          color: #000000;
          font-size: 20px;
          font-weight: bold;
          font: caption;
        }
</style>