<template>
    <body>
    <div class="container">
        <div class="header">
            <li class="back-button"><NuxtLink to ="/Main-Menu/Custom-Schedule/custom-sched">Back</NuxtLink></li>
            <div class="schedule-name">Schedule Name</div>
        </div>

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
</script>

<style scoped>
    body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            text-align: center;
        }

        .back-button {
            float: left;
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
        }
</style>