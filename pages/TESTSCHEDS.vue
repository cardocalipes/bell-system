<template>
    <div>
      <div class="time">
        <p>Current Time: {{ currentDateTime }}</p>
      </div>
      <div v-if="selectedSchedule === 1">
        <h1>Schedule 1</h1>
        <pre>{{ filteredData }}</pre>
        <h2>Ring Type:</h2>
        <p id="schedule-type">N/A</p>
        <h2>Status:</h2>
        <p id="schedule-status">Inactive</p>
        <button @click="fetchData(1)">Fetch Schedule 1</button>
      </div>
      <div v-else-if="selectedSchedule === 2">
        <h1>Schedule 2</h1>
        <pre>{{ filteredData }}</pre>
        <h2>Ring Type:</h2>
        <p id="schedule-type">N/A</p>
        <h2>Status:</h2>
        <p id="schedule-status">Inactive</p>
        <button @click="fetchData(2)">Fetch Schedule 2</button>
      </div>
      <div v-else-if="selectedSchedule === 3">
        <h1>Schedule 3</h1>
        <pre>{{ filteredData }}</pre>
        <h2>Ring Type:</h2>
        <p id="schedule-type">N/A</p>
        <h2>Status:</h2>
        <p id="schedule-status">Inactive</p>
        <button @click="fetchData(3)">Fetch Schedule 3</button>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { DateTime } from 'luxon';
  import dayjs from "dayjs";
  import utc from "dayjs/plugin/utc";
  dayjs.extend(utc);
  
  const selectedSchedule = ref(1); // Default selected schedule
  const filteredData = ref([]);
  const currentDateTime = ref('');
  onMounted(updateDateTime);
  
  function updateDateTime() {
    const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm');
    currentDateTime.value = formattedDateTime;
  }
  
  async function fetchData(schedule) {
    try {
      const response = await useFetch(`/api/sched${schedule}`);
      filteredData.value = response.data.value.map(data => dayjs(data.realtime).format("HH:mm"));
      updateStatus(filteredData.value, `Schedule ${schedule}`);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }
  
  function updateStatus(scheduleTimes, scheduleName) {
    const currentIndex = scheduleTimes.findIndex(time => time === currentDateTime.value);
    const statusElement = document.querySelector("#schedule-status");
    const ringTypeElement = document.querySelector("#schedule-type");
  
    if (statusElement && ringTypeElement) {
      if (currentIndex !== -1) {
        const ringType = (currentIndex % 2 === 0) ? 'Second Ring' : 'First Ring';
        statusElement.textContent = 'Active';
        ringTypeElement.textContent = `Ring Type: ${ringType}`;
      } else {
        statusElement.textContent = 'Inactive';
        ringTypeElement.textContent = 'Ring Type: N/A';
      }
    }
  }
  </script>
  
  <style scoped>
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
  