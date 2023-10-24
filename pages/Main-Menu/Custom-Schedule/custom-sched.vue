<template>
    <li class="back-button"><NuxtLink to ="/Main-Menu/main-menu">Back</NuxtLink></li>
    <div class="container">
        <h2>Custom</h2>
        <div class="box" onclick="goToSavedSchedulesPage()">
            <span class="box-icon"><NuxtLink to = "/Main-Menu/Custom-Schedule/Saved-Sched/saved-sched">&#x1F4C2;</NuxtLink></span>
            <div class="box-label"><NuxtLink to = "/Main-Menu/Custom-Schedule/Saved-Sched/saved-sched">Saved Schedules</NuxtLink></div>
        </div>
        <div class="box" onclick="goToAddCustomPage()">
            <span class="box-icon"><NuxtLink to = "/Main-Menu/Custom-Schedule/Add-Custom/add-custom">&#x2795;</NuxtLink></span>
            <div class="box-label"><NuxtLink to = "/Main-Menu/Custom-Schedule/Add-Custom/add-custom">Add Custom</NuxtLink></div>
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
</script>

<style scoped>
body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
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
            height: 97.25vh;

            background-image: url('~/public/images/bg.png');
            background-size: 1260px 600px;
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
            transform: scale(1.05);
        }
        .box-icon {
            font-size: 48px;
            margin-bottom: 10px;
        }
        .box-label {
            font-size: 18px;
            font-weight: bold;
        }
</style>