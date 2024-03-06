<!-- pages/TimeDisplay.vue -->
<!-- npm install luxon -->
<template>
  <div>
    <h1 class="time">TIME CHEEEECK:</h1>
    <p class="time">{{ currentTime }}</p>
  </div>
</template>

<script>
import { DateTime } from 'luxon';

export default {
  data() {
    return {
      currentTime: '',
    };
  },
  mounted() {
    this.getCurrentTime();
    setInterval(this.getCurrentTime, 1000); // Update time every second
  },
  methods: {
    getCurrentTime() {
      const currentTime = DateTime.now().setZone('Asia/Manila').toFormat('yyyy-MM-dd HH:mm:ss');
      this.currentTime = currentTime;
    },
  },
};
</script>

<style scoped>
/* Add your custom styles here if needed */
  .time {
    font: caption;
    font-size: 50px;
    font-weight: bold;
  }
</style>
