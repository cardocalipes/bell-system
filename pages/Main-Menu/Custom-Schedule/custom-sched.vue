<template>
    <div class="container">
        <div class="time">
        <p>{{ currentDateTime }}</p>
        </div>
        <div class="header">
            <h1>CUSTOM SCHEDULES</h1>
        </div>
        <li class="back-button"><NuxtLink to ="/Main-Menu/main-menu">Back</NuxtLink></li>
        <div class="scontainer">
            <div class="box" onclick="goToSavedSchedulesPage()">
                <span class="box-icon"><NuxtLink to = "/Main-Menu/Custom-Schedule/Saved-Sched/saved-sched">&#x1F4C2;</NuxtLink></span>
                <div class="box-label"><NuxtLink to = "/Main-Menu/Custom-Schedule/Saved-Sched/saved-sched">Saved Schedules</NuxtLink></div>
            </div>
            <div class="box" onclick="goToAddCustomPage()">
                <span class="box-icon"><NuxtLink to = "/Main-Menu/Custom-Schedule/Add-Custom/add-custom">&#x2795;</NuxtLink></span>
                <div class="box-label"><NuxtLink to = "/Main-Menu/Custom-Schedule/Add-Custom/add-custom">Add Custom</NuxtLink></div>
            </div>
        </div>
    </div>
</template>

<script setup>
function goToSavedSchedulesPage() {
            // Redirect to the "Saved Schedules" page
            //window.location.href = "/Main-Menu/Pick-Schedule/pick-sched";
        }

        function goToAddCustomPage() {
            // Redirect to the "Add Custom" page
            window.location.href = "add-custom.html";
        }

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
            margin: 0;
            padding: 0;
        }
        .header{
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
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 20px 20px;
            cursor: pointer;
            font: caption;
            font-size: 20px;
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
            width: 500px;
            padding: 80px 0 100px 0;
            margin: 100px 50px 0 50px;
        }
        .scontainer{
            padding: 50px;
            text-align: center;
        }
        .box:hover {
            transform: scale(1.05);
        }
        .box-icon {
            font-size: 100px;
        }
        .box-label {
            font-size: 18px;
            font-weight: bold;
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