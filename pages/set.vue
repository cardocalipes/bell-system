<template>
  <div>
    <h1>Choose a Schedule</h1>
    <button @click="selectSchedule('sched')">Schedule 1</button>
    <button @click="selectSchedule('schedtwo')">Schedule 2</button>
    <button @click="selectSchedule('schedthree')">Schedule 3</button>
  </div>
</template>

<script setup>  
function selectSchedule(schedule) {
  sessionStorage.setItem('selectedSchedule', schedule);
  // Redirect to the view page
  window.location.href = '/view';
}
</script>
