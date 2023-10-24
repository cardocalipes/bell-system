<template>
    <div class="header">
        <h1>SAVED SCHEDULES</h1>
    </div>
    <li class="back-button"><NuxtLink to ="/Main-Menu/Custom-Schedule/custom-sched">&#8592; Back</NuxtLink></li>
    <div class="schedule-container">
        <div class="schedule-column" onclick="applySchedule(1)">Schedule Name 1</div>
        <div class="schedule-column" onclick="applySchedule(2)">Schedule Name 2</div>
        <div class="schedule-column" onclick="applySchedule(3)">Schedule Name 3</div>
        <div class="schedule-column" onclick="applySchedule(4)">Schedule Name 4</div>
        <div class="schedule-column" onclick="applySchedule(5)">Schedule Name 5</div>
        <div class="schedule-column" onclick="applySchedule(6)">Schedule Name 6</div>
        <div class="schedule-column" onclick="applySchedule(7)">Schedule Name 7</div>
        <div class="schedule-column" onclick="applySchedule(8)">Schedule Name 8</div>
        <div class="schedule-column" onclick="applySchedule(9)">Schedule Name 9</div>
        <div class="schedule-column" onclick="applySchedule(10)">Schedule Name 10</div>
        <div class="buttons">
            <button onclick="applyClickedSchedule()">Apply</button>
            <button>Edit</button>
        </div>
    </div>
</template>

<script setup>
    var selectedSchedule = null;

    function applySchedule(scheduleNumber) {
        selectedSchedule = scheduleNumber;
        resetColumnStyles();
        document.querySelectorAll('.schedule-column')[scheduleNumber - 1].style.backgroundColor = '#33cc33';
    }

    function applyClickedSchedule() {
        if (selectedSchedule !== null) {
            alert("The selected schedule is applied to the system.");
        } else {
            alert("Please select a schedule to apply.");
        }
    }

    function resetColumnStyles() {
        var columns = document.querySelectorAll('.schedule-column');
        for (var i = 0; i < columns.length; i++) {
            columns[i].style.backgroundColor = '#f9f9f9';
        }
    }
</script>

<style scoped>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .header {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: #fff;
        }
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
        }
        .schedule-container {
            width: 80%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .schedule-column {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 5px;
            cursor: pointer;
            display: inline-block;
            width: calc(10% - 10px);
            text-align: center;
            background-color: #f9f9f9;
        }
        .schedule-column:hover {
            background-color: #e0e0e0;
        }
        .buttons {
            text-align: center;
            margin-top: 20px;
        }
</style>