<!-- pages/schedule1.vue -->

<template>
    <div>
      <h1>Schedule 3</h1>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Ring Number</th>
            <th>Real Time</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="row in sched3Data" :key="row.id">
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

  const sched3Data = ref();

  async function sched3() {
    const sched3 = await useFetch("/api/schedthree");
    sched3Data.value = sched3.data.value;
  }

await sched3(); 
console.log(sched3Data.value);
  </script>