<template>
  <div class="container">
    <div class="content">
      <h1 class="header"> Current Time: {{ currentDateTime }}</h1>
      <div class="schedule-details" v-if="currentSchedule">
        <h1>{{ currentSchedule.name }}</h1>
        <pre>{{ currentSchedule.data }}</pre>
        <div class="line">
          <h2>Ring Type:</h2>
          <p>Ring Type: {{ currentSchedule.ringType }}</p>
        </div>
        <div class="line">
          <h2>Status:</h2>
          <p>Status: {{ currentSchedule.status }}</p>
        </div>
      </div>
      <ul class="back-button">
        <li><router-link to="/Main-Menu/Pick-Schedule/pick-sched">Back</router-link></li>
      </ul>
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
  setInterval(updateDateTime, 1000);
  updateDateTime();
  setTimeout(() => {
    const savedSched = localStorage.getItem('selectedSchedule');
    fetchData(savedSched);
  }, 500); // Adjust the delay as needed
});

function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm');
  currentDateTime.value = formattedDateTime;
}

async function fetchData(apiEndpoint) {
  try {
    const response = await useFetch(`/api/${apiEndpoint}`);
    console.log(response);
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
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  background-image: url('~/public/images/bg.png');
  background-size: cover;
  background-position: center;
  height: 100vh;
  background-repeat: no-repeat;
  font: caption;
  color: #07053a;
}

.content {
  text-align: center;
}

.header {
  font-size: 50px;
  font-weight: bold;
  color: #07053a;
  margin-bottom: 20px;
}

.schedule-details {
  margin-top: 20px;
}

.line {
  margin-top: 10px;
  color: #07053a;
}

.back-button {
  position: absolute;
  left: 10px;
  top: 10px;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 0px 30px;
  cursor: pointer;
  font: caption;
  font-size: 20px;
}
</style>
