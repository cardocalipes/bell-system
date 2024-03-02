<template>
    <div class="container">
        <div class="header">
            <h1>CUSTOM SCHEDULE</h1>
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
            padding: 10px 20px;
            cursor: pointer;
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
            padding: 40px 0;
            margin: 30px 200px 50px 200px;
            font: caption;
            font-size: 15px;
        }
        .scontainer{
            padding: 50px;
        }
        .box:hover {
            transform: scale(1.05);
        }
        .box-icon {
            font-size: 80px;
        }
        .box-label {
            font-size: 18px;
            font-weight: bold;
        }
</style>