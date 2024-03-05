<!-- pages/TimeDisplay.vue -->
<!-- npm install luxon -->
<template>
  <div>
    <h1>Current Time in the Philippines</h1>
    <p>{{ currentTime }}</p>
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
</style>
