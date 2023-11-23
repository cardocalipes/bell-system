<!-- pages/schedule1.vue -->

<template>
    <div>
      <h1>Schedule 2</h1>
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
          <tr v-for="row in sched2Data" :key="row.id">
            <td>{{ row.id2 }}</td>
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

  const sched2Data = ref();

  async function sched2() {
    const sched2 = await useFetch("/api/schedtwo");
    sched2Data.value = sched2.data.value;
  }

await sched2(); 
console.log(sched2Data.value);
  </script>