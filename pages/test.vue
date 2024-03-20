<template>
  <div>
    <table v-if="sched1Data">
      <tr>
        <td>{{ dayjs(sched1Data.realtime).format("HH:mm:ss") }}</td>
      </tr>
    </table>
    <div>
      <p>{{ currentDateTime }}</p>
      <p>{{ counter }}</p>
      <p> {{ sched1Data }}</p>
      <p> {{  setTime }}</p>
    </div>
  </div>
</template>

<script setup>
import dayjs from "dayjs";
import { ref, onMounted } from 'vue';
import { DateTime } from 'luxon';

const sched1Data = ref();
const currentDateTime = ref('');
const counter = ref(0);

const sched1 = await useFetch("/api/test/aa");
sched1Data.value = dayjs(sched1Data.realtime).format("HH:mm");

onMounted(async () => {
  try {
    setInterval(updateDateTime, 1000);
    updateDateTime();
  } catch (error) {
    console.error('Error fetching data:', error);
  }
});

function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm:ss');
  currentDateTime.value = formattedDateTime;
  currentCounter();
}

function currentCounter() {
  if (currentDateTime.value === dayjs(sched1Data.value.realtime).format("HH:mm:ss")) {
    counter.value += 1;
  }
}

</script>
