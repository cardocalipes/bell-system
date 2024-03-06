<template>
    <body>
    <div class="container">
        <div class="time">
        <p>{{ currentDateTime }}</p>
        </div>
        <li class="back-button"><NuxtLink to ="/Main-Menu/Custom-Schedule/custom-sched">Back</NuxtLink></li>
        <div class="header">
            <div class="schedule-name">Schedule Name:</div><input id="sched-name">
        </div>
        <div class="content">
            <div class="form-group">
                <label class="label" for="start-time">Start Time:</label>
                <input class="input" v-model="startTime" type="time" id="start-time">
            </div>

            <div class="form-group">
                <label class="label" for="duration">Duration:</label>
                <input class="input" v-model="duration" type="time" id="duration">
            </div>

            <div class="form-group">
                <label class="label">Break Time:</label>
                <label class="checkbox-label" for="break-yes">Yes</label>
                <input type="checkbox" id="break-yes">
                <label class="checkbox-label" for="break-no">No</label>
                <input type="checkbox" id="break-no">
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
const startTime = ref();
const duration = ref();

async function apply(){
    const {data: { value: applySched}} = await useFetch ("/api/apply", {
        method: "POST",
        body: {
            startTime: startTime.value,
            duration: duration.value
        }
       
})
        console.log(applySched);
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
          font-size: 14px;
          font-weight: bold;
        }
</style>