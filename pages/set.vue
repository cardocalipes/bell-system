<template>
  <div>
    <h1>Choose a Schedule</h1>
    <button @click="selectSchedule('customsched1')">CSched 1</button>
    <button @click="selectSchedule('customsched2')">CSched 2</button>
    <button @click="selectSchedule('customsched3')">CSched 3</button>
    <button @click="selectSchedule('customsched4')">CSched 4</button>
    <button @click="selectSchedule('customsched5')">CSched 5</button>
    <button @click="selectSchedule('customsched6')">CSched 6</button>
    <button @click="selectSchedule('customsched7')">CSched 7</button>
    <button @click="selectSchedule('customsched8')">CSched 8</button>
    <button @click="selectSchedule('customsched9')">CSched 9</button>
    <button @click="selectSchedule('customsched10')">CSched 10</button>
  </div>
</template>

<script setup>  
function selectSchedule(schedule) {
  localStorage.setItem('selectedSchedule', schedule);
  // Redirect to the view page
  window.location.href = '/view';
}
</script>
