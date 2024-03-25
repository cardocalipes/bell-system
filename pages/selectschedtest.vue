<template>
    <div>
      <h1> Current Time: {{ currentDateTime }}</h1>
      <div>
        <button @click="fetchData('sched')">Fetch Schedule 1</button>
        <button @click="fetchData('schedtwo')">Fetch Schedule 2</button>
        <button @click="fetchData('schedthree')">Fetch Schedule 3</button>
      </div>
      <div v-if="currentSchedule">
        <h1>{{ currentSchedule.name }}</h1>
        <pre>{{ currentSchedule.data }}</pre>
        <h2>Ring Type:</h2>
        <p>Ring Type: {{ currentSchedule.ringType }}</p>
        <h2>Status:</h2>
        <p>Status: {{ currentSchedule.status }}</p>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { DateTime } from 'luxon';
  import dayjs from 'dayjs';
  import utc from 'dayjs/plugin/utc';
  dayjs.extend(utc);
  
  const currentDateTime = ref('');
  const currentSchedule = ref(null);
  
  onMounted(() => {
    // Update date and time every second
    setInterval(updateDateTime, 1000);
    // Initial update
    updateDateTime();
  });
  
  function updateDateTime() {
    const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm');
    currentDateTime.value = formattedDateTime;
  }
  
  async function fetchData(apiEndpoint) {
    try {
      const response = await useFetch(`/api/${apiEndpoint}`);
      const filteredData = response.data.value.map(data => dayjs(data.realtime).format('HH:mm'));
      const currentIndex = filteredData.findIndex(time => time === currentDateTime.value);
      const ringType = (currentIndex !== -1 && currentIndex % 2 === 0) ? 'Second Ring' : 'First Ring';
      currentSchedule.value = {
        name: apiEndpoint.toUpperCase(),
        data: filteredData,
        ringType: currentIndex !== -1 ? ringType : 'N/A',
        status: currentIndex !== -1 ? 'Active' : 'Inactive'
      };
    } catch (error) {
      console.error('Error fetching data:', error);
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
  