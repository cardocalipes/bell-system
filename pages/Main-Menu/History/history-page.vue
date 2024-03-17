<template>
    <div class="container">
        <div class="time">
        <p>{{ currentDateTime }}</p>
        </div>
        <li class="back-button"><NuxtLink to ="/Main-Menu/main-menu">Back</NuxtLink></li>
        <div class="header">
            <h1>HISTORY</h1>
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
        .container{
            background-image: url('~/public/images/bg.png');
            background-size: cover;
            background-position: center;
            height: 100vh;
            background-repeat: no-repeat;
            background-attachment: fixed;
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