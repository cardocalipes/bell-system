<script setup>
import dayjs from "dayjs";
import { ref, onMounted } from 'vue';
import { DateTime } from 'luxon';

const sched1Data = ref(await useFetch("/api/test/aa").data);
const currentDateTime = ref('');
const counter = ref(0);
const setSched = dayjs(sched1Data.realtime).format("HH:mm:ss");
onMounted(() => {
  setInterval(updateDateTime, 1000);
  updateDateTime();
});

function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm:ss');
  currentDateTime.value = formattedDateTime;
  currentCounter(); 
}

function currentCounter() {
  if (currentDateTime === dayjs(sched1Data.realtime).format("HH:mm:ss")) {
    counter.value += 1; 
  }
}
function incrementCounter() {
  counter.value += 1;
}
</script>

<template>
  <table>
    <tr>
      <td>{{ dayjs(sched1Data.realtime).format("HH:mm:ss") }}</td>
    </tr>
  </table>
  <div>
    <p> {{ currentDateTime }}</p>
    <p> {{ counter}}</p>
    <button @click="incrementCounter">Increment Counter</button>
  </div>
</template>
