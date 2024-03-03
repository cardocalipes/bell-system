// for testing purposes dont mind
<template>
    
    <div>
      <h1>Sensor Status</h1>
      <div v-if="sensorData">
        <div v-for="(status, sensor) in sensorData" :key="sensor">
          <h2>{{ `Sensor ${sensor}: ${status}` }}</h2>
        </div>
      </div>
      <div v-else>
        <p>Loading sensor status...</p>
      </div>
    </div>
  </template>
  
  <script setup>
  import { onMounted, ref } from 'vue'
  import { useIntervalFn } from '@vueuse/core'
  
  const { data, refresh } = useAsyncData('sensor-status', async () => {
    // Fetch sensor status from your ESP server
    const response = await $fetch('http://192.168.0.8/sensor1') // Update with your ESP's IP and endpoint
    return response.data // Assuming the response has a 'data' property with sensor status
  })
  
  onMounted(async () => {
    await refresh()
  })
  </script>