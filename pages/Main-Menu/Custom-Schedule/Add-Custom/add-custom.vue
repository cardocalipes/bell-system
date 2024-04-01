<template>
    <body>
        <div class="container">
            <div class="time">
                <p>{{ currentDateTime }}</p>
            </div>
            <li class="back-button"><NuxtLink to="/Main-Menu/Custom-Schedule/custom-sched">Back</NuxtLink></li>
            <div class="header">
                <div class="schedule-name">Schedule Name:</div>
                <input class="input" v-model="schedname" type="string" id="sched-name">
            </div>
            <div class="content">
                <div class="form-group">
                    <label class="label" for="start-time">Start Time:</label>
                    <input class="input" v-model="startTime" type="time" id="start-time">
                </div>

                <div class="form-group">
                    <label class="label" for="duration">Duration:</label>
                    <input class="input" v-model="duration" type="number" id="duration">
                </div>

                <div class="form-group">
                    <label class="label" for="custom-schedule">Custom Schedule Number:</label>
                    <select v-model="customScheduleNumber" class="input" id="custom-schedule">
                        <option v-for="num in 10" :value="num">{{ num }}</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="label">Break Time:</label>
                    <label class="checkbox-label" for="break-yes">Yes</label>
                    <input type="radio" id="break-yes" value="yes" v-model="breakTimeOption">
                    <label class="checkbox-label" for="break-no">No</label>
                    <input type="radio" id="break-no" value="no" v-model="breakTimeOption">
                </div>
            </div>
            <div class="buttons">
                <button @click="apply()">Apply</button>
                <button>Cancel</button>
            </div>
        </div>
    </body>
</template>

<script setup>
import { ref } from 'vue';
import { DateTime } from 'luxon';

const schedname = ref('');
const startTime = ref('');
const duration = ref('');
const customScheduleNumber = ref('');
const breakTimeOption = ref('');

async function apply() {
    // Validate input values
    console.log(breakTimeOption.value);
    if (!startTime.value || !duration.value) {
        alert("Please enter start time and duration.");
        return;
    }

    // Convert start time to Luxon DateTime object
    const startDateTime = DateTime.fromFormat(startTime.value, 'HH:mm');

    // Convert duration to minutes
    const durationMinutes = parseInt(duration.value);

    // Initialize an array to store schedule times
    const scheduleTimes = [];
    let counts = 0;
    
    // Set initial time to start time
    let currentTime = startDateTime;

    // Loop until reaching the end of the duration
    while (counts < 12) {
        // Push current time to scheduleTimes array
        if (counts == 0){
            scheduleTimes.push(currentTime.toFormat('HH:mm'));
        }
        // Add 5 minutes for the next ring
        if((counts == 2 || counts == 9) && breakTimeOption.value == "yes"){
            currentTime = currentTime.plus({ minutes: 5 });
            scheduleTimes.push(currentTime.toFormat('HH:mm'));
            currentTime = currentTime.plus({ minutes: 15 });
            scheduleTimes.push(currentTime.toFormat('HH:mm'));
        } else {
            currentTime = currentTime.plus({ minutes: 5 });
            scheduleTimes.push(currentTime.toFormat('HH:mm'));
            currentTime = currentTime.plus({ minutes: duration.value - 5 }); //duration - 5
            scheduleTimes.push(currentTime.toFormat('HH:mm'));
        }
        
        counts=counts+1;
        if((counts == 10) && breakTimeOption.value == "no"){
            break;
        }
    }
    currentTime = currentTime.plus({ minutes: 5 });
    scheduleTimes.push(currentTime.toFormat('HH:mm'));
    // Output the generated schedule times
    console.log(scheduleTimes);

    const payload = {
        schedname: schedname.value,
        startTime: startTime.value,
        duration: duration.value,
        customScheduleNumber: customScheduleNumber.value,
        scheduleTimes: scheduleTimes,
    };

    // Example of sending the data to your backend
    // Adjust URL and method as necessary
    await fetch('/api/apply', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(payload),
    });
    // Here you can send the generated scheduleTimes to your backend API or perform any other necessary action.
}


const currentDateTime = ref('');

function updateDateTime() {
    const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('yyyy-MM-dd HH:mm:ss');
    currentDateTime.value = formattedDateTime;
}

onMounted(() => {
    // Update date and time every second
    setInterval(updateDateTime, 1000);
    // Initial update
    updateDateTime();
});
</script>

<style scoped>
    body {
            font-family: Arial, sans-serif;
        }

        .container {
            background-image: url('~/public/images/bg.png');
            background-size: cover;
            background-position: center;
            height: 100vh;
             background-repeat: no-repeat;
        }
        .content {
            text-align: center;
            font: caption;
            font-size: 20px;
            background-color: #b7d9ff;
            margin: 50px 300px;
            padding: 20px 0 50px 0;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .header {
            text-align: center;
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

        .schedule-name {
            font-size: 24px;
            padding-top: 20px;
        }

        .form-group {
            margin-top: 20px;

        }

        .label {
            display: inline-block;
            width: 100px;
        }

        .input {
            width: 200px;
        }

        .checkbox-label {
            display: inline-block;
            width: 100px;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
            padding: 0 10px;
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