<!-- pages/schedule1.vue -->

<template>
    <div>
        <h1>Schedule 1</h1>
        <pre>
            {{ filteredData[ctr]}}
            {{ currentDateTime}}
            {{ ctr }}
        </pre>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { DateTime } from 'luxon';
  import dayjs from "dayjs";
  import utc from "dayjs/plugin/utc";
  dayjs.extend(utc);

  const currentDateTime = ref('');
  const sched1Data = ref();
  const filteredData = ref([]);
  const ctr = ref(25);

  async function fetchData() {
  try {
    const response = await useFetch("/api/sched");
    sched1Data.value = response.data.value;
    for(const data of response.data.value) {
        filteredData.value.push(dayjs(data.realtime).format("HH:mm:ss"))
    }
  } catch (error) {
    console.error("Error fetching data:", error);
  }
}
fetchData();

onMounted(() => {
  // Update date and time every second
  setInterval(updateDateTime, 1000);
  // Initial update
  updateDateTime();
});

function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm:ss');
  currentDateTime.value = formattedDateTime;
  currentCounter();
}

function currentCounter() {
  if (currentDateTime.value === filteredData[ctr]) {
    ctr.value += 1;
  }
}
  </script>