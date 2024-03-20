<template>
    <div class="time">
      <p>{{ currentDateTime }}</p>
    </div>
    <div v-if="data">
      <h2>{{ data.sensor1 }}</h2>
      <h2>{{ data.sensor2 }}</h2>
      <h2>{{ data.sensor3 }}</h2>
      <h2>{{ data.sensor4 }}</h2>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { DateTime } from 'luxon';
  import dayjs from "dayjs";
  import { useIntervalFn } from '@vueuse/core'; // Import useIntervalFn
  
  let oddOrEvenCtr = 1; 
  let counter = 0; // Initialize counter
  
  const currentDateTime = ref('');
  
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
  
  // Use async function to fetch sensor data
  async function fetchData() {
    const [sensor1, sensor2, sensor3, sensor4] = await Promise.all([
      $fetch('http://192.168.64.82/sensor1'),
      $fetch('http://192.168.64.47/sensor2'),
      $fetch('http://192.168.64.209/sensor3'),
      $fetch('http://192.168.64.94/sensor4')
    ]);
  
    return { sensor1, sensor2, sensor3, sensor4 };
  }
  
  // Set up useIntervalFn to fetch data periodically
  useIntervalFn(async () => {
    const { data: fetchedData } = await fetchData();
  
    if (fetchedData) {
      // Check if fetchedData is not null or undefined
      if (
        fetchedData.sensor1 &&
        fetchedData.sensor2 &&
        fetchedData.sensor3 &&
        fetchedData.sensor4 &&
        fetchedData.sensor1.s1 === "active" &&
        fetchedData.sensor2.s2 === "active" &&
        fetchedData.sensor3.s3 === "active" &&
        fetchedData.sensor4.s4 === "active"
      ) {
        // Perform actions based on sensor data
        // useFetch('http://192.168.64.47/setAlarm', { ... });
      } else if (fetchedData.sensor1 && fetchedData.sensor1.s1 === "active_fire") {
        // Perform actions for fire sensor
        // useFetch('http://192.168.64.47/setAlarm', { ... });
      }
  
      // Other conditions and actions based on sensor data
  
      refresh(); // Refresh data periodically
    }
  }, 750);
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
  