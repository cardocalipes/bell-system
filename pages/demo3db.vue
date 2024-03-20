<!-- pages/schedule1.vue -->

<template>
    <div>
        <h1>Schedule 1</h1>
        <pre>
            {{ filteredData }}
        </pre>
    </div>
  </template>
  
  <script setup>
  import dayjs from "dayjs";
  import utc from "dayjs/plugin/utc";
  dayjs.extend(utc);

  const sched1Data = ref();
  const filteredData = ref([]);

  async function fetchData() {
  try {
    const response = await useFetch("/api/sched");
    sched1Data.value = response.data.value;
    for(const data of response.data.value) {
        filteredData.value.push(dayjs(data.realtime).format("HH:mm"))
    }
  } catch (error) {
    console.error("Error fetching data:", error);
  }
}

fetchData();
  </script>