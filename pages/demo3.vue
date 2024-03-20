<template>
    <div class="time">
      <p>{{ currentDateTime }}</p>
    </div>

  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { DateTime } from 'luxon';
  import dayjs from "dayjs";

  
  const currentDateTime = ref('');
  
  onMounted(() => {
    setInterval(updateDateTime, 1000);
 
    updateDateTime();
  });
  
  function updateDateTime() {
    const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm');
    currentDateTime.value = formattedDateTime;
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
  