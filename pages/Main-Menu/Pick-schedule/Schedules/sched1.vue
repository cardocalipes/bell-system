<!-- pages/schedule1.vue -->

<template>
    <div>
      <h1>Schedule 1</h1>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Ring Number</th>
            <th>Real Time</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="row in sched1Data" :key="row.id">
            <td>{{ row.id }}</td>
            <td>{{ row.ringnumber }}</td>
            <td>{{ dayjs(row.realtime).format("HH:mm") }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script setup>
  import dayjs from "dayjs";
  import utc from "dayjs/plugin/utc";
  dayjs.extend(utc);

  const sched1Data = ref();

  async function sched1() {
    const sched1 = await useFetch("/api/sched");
    sched1Data.value = sched1.data.value;
  }

await sched1(); 
console.log(sched1Data.value);
  </script>