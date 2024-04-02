<template>
  <div class="container">
    <h1> Current Time: {{ currentDateTime }}</h1>
    <ul class="back-button">
      <li><router-link to="/Main-Menu/Pick-Schedule/pick-sched">Back</router-link></li>
    </ul>
    <div class="content" v-if="currentSchedule">
      <div class="line">
        <h1>{{ currentSchedule.name }}</h1>
        <pre>{{ currentSchedule.data }}</pre>
      </div>
      <div class="line">
        <h2>Ring Type:</h2>
        <p>Ring Type: {{ currentSchedule.ringType }}</p>
      </div>
      <div class="line">
        <h2>Status:</h2>
        <p>Status: {{ currentSchedule.status }}</p>
      </div>
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

.line{
  padding: 80px 0 0 100px;
  display: inline-block;
  color: #07053a;
}

.container {
  display: flex;
  justify-content: space-evenly;
  align-items: left;

  background-image: url('~/public/images/bg.png');
  background-size: cover;
  background-position: center;
  height: 100vh;
  background-repeat: no-repeat;
  font: caption;
  color: #07053a;
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
.back-button {
            position: absolute;
            left: 10px;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 0px 30px;
            cursor: pointer;
            font: caption;
            font-size: 20px;
        }
</style>
