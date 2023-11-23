<!-- pages/schedule1.vue -->

<template>
    <div>
      <h1>Schedule 3</h1>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Ring Number</th>
            <th>Timer</th>
            <th>Real Time</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="row in sched3Data" :key="row.id">
            <td>{{ row.id3 }}</td>
            <td>{{ row.ring_number }}</td>
            <td>{{ dayjs.utc(row.timer).utcOffset(-8, true).format("HH:mm") }}</td>
            <td>{{ dayjs.utc(row.real_time).utcOffset(-8, true).format("HH:mm") }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script setup>
  import dayjs from "dayjs";
  import utc from "dayjs/plugin/utc";
  dayjs.extend(utc);

  const sched3Data = ref();

  async function sched3() {
    const sched3 = await useFetch("/api/schedthree");
    sched3Data.value = sched3.data.value;
  }

await sched3(); 
console.log(sched3Data.value);
  </script>