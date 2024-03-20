

<template>
<p> Current Time: {{currentDateTime}}</p>
<p> Set Time: {{setTime}}</p>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { DateTime } from 'luxon';
import dayjs from 'dayjs';

const sched1Data = ref(await useFetch("/api/test/aa").data);
const currentDateTime = ref('');
let setTime = ref(dayjs(sched1Data.realtime).format("HH:mm"));

onMounted(() => {
  // Update date and time every second
  setInterval(updateDateTime, 1000);
  // Initial update
  updateDateTime();
});
function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm:ss');
  currentDateTime.value = formattedDateTime;
}

</script>