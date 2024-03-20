<template>
<p> Current Time: {{currentDateTime}}</p>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { DateTime } from 'luxon';

const currentDateTime = ref('');

onMounted(() => {
  // Update date and time every second
  setInterval(updateDateTime, 1000);
  // Initial update
  updateDateTime();
});

function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('yyyy-MM-dd HH:mm:ss');
  currentDateTime.value = formattedDateTime;
}

</script>
