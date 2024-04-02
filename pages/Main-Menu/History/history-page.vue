<template>
    <body class="container">
        <div class="tbl">
        <div class="time">
            <p>{{ currentDateTime }}</p>
        </div>
        <li class="back-button"><NuxtLink to="/Main-Menu/main-menu">Back</NuxtLink></li>
        <div class="header">
            <h1>HISTORY</h1>
        </div>
        <table class="history-table" v-if="historyData">
            <thead>
            <tr>
                <th>Date and Time</th>
                <th>Type</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="item in historyData" :key="item.id">
                <td>{{ item.dateAndTime }}</td>
                <td>{{ item.type }}</td>
            </tr>
            </tbody>
        </table>
        <div v-if="error">{{ error }}</div>
        </div>
    </body>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { DateTime } from 'luxon';
  
  const currentDateTime = ref('');
  const { data: historyData, error } = await useFetch('/api/history');
  
  onMounted(() => {
    setInterval(() => {
      currentDateTime.value = DateTime.now().setZone('Asia/Manila').toFormat('yyyy-MM-dd HH:mm:ss');
    }, 1000);
  });
  </script>
  
  <style scoped>
  /* Add your existing styles here */
  .tbl{
    background-color: #ffffff;
    color: rgb(0, 0, 0);
  }
  .container {
  background-image: url('~/public/images/bg.png');
  background-size: cover;
  background-position: center;
  height: 100vh;
  background-repeat: no-repeat; 
  background-attachment: fixed;
  position: relative;
}
  .history-table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
  }
  .history-table th,
  .history-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
  }
  .history-table th {
    background-color: #04AA6D;
    color: white;
  }
  </style>
  