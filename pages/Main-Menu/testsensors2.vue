<template>
    <div class="time">
      <p>{{ currentDateTime }}</p>
    </div>
    <div>
      <h2>{{ data.sensor1 }}</h2>
      <h2>{{ data.sensor2 }}</h2>
      <h2>{{ data.sensor3 }}</h2>
      <h2>{{ data.sensor4 }}</h2>
      <p>{{ filteredData }}</p>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted, watch } from 'vue';
  import { DateTime } from 'luxon';
  import dayjs from 'dayjs';
  
  const currentDateTime = ref('');
  const schedData = ref();
  const filteredData = ref([]);
  const type = ref();
  const ipAddresses = ref([]);
  
  onMounted(() => {
    setInterval(updateDateTime, 1000);
    updateDateTime();
  
    const savedIPs = localStorage.getItem('ipAddresses');
    if (savedIPs) {
      ipAddresses.value = JSON.parse(savedIPs);
    }
  });
  
  async function fetchData() {
    console.log('FETCHED DATA SUCCESSFULLY');
    try {
      const response = await fetch('/api/sched');
      const responseData = await response.json();
      schedData.value = responseData.value;
      for (const data of responseData.value) {
        filteredData.value.push(dayjs(data.realtime).format('HH:mm'));
      }
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }
  
  const { data, refresh } = useAsyncData('sensor', async () => {
    const [sensor1, sensor2, sensor3, sensor4] = await Promise.all([
      fetch(`http://${ipAddresses.value[0]}/sensor1`),
      fetch(`http://${ipAddresses.value[0]}/sensor2`),
      fetch(`http://${ipAddresses.value[0]}/sensor3`),
      fetch(`http://${ipAddresses.value[0]}/sensor4`)
    ]);
  
    return { sensor1: sensor1Data, sensor2: sensor2Data, sensor3: sensor3Data, sensor4: sensor4Data };
  });
  
  fetchData();
  
  watch(currentDateTime, (newDateTime, oldDateTime) => {
    const currentTime = dayjs(newDateTime).format('HH:mm');
    const currentIndex = filteredData.value.indexOf(currentDateTime.value);
  
    if (filteredData.value.includes(currentDateTime.value)) {
      console.log('HAHA: ', currentIndex);
      console.log('TEST');
      const oddOrEvenCtr = currentIndex % 2;
      const ringId = oddOrEvenCtr === 0 ? 'secondRing' : 'firstRing';
      console.log('ID: ', ringId);
      fetch(`${ipAddresses.value[0]}/setAlarm`, {
        method: 'post',
        body: JSON.stringify({ id: ringId, alarm: 'now', duration: '2' }),
        headers: { 'Content-Type': 'application/json' }
      });
    } else {
      console.log(filteredData);
      const sensorData = data.value;
      if (sensorData.sensor1.s1 == 'active' && sensorData.sensor2.s2 == 'active' && sensorData.sensor3.s3 == 'active' && sensorData.sensor4.s4 == 'active') {
        fetch(`${ipAddresses.value[0]}/setAlarm`, {
          method: 'post',
          body: JSON.stringify({ id: 'emergency', alarm: 'now', duration: '15' }),
          headers: { 'Content-Type': 'application/json' }
        });
        earthquakeDatabase();
      } else if (sensorData.sensor1.s1 == 'active_fire') {
        fetch(`${ipAddresses.value[0]}/setAlarm`, {
          method: 'post',
          body: JSON.stringify({ id: 'emergency', alarm: 'now', duration: '10' }),
          headers: { 'Content-Type': 'application/json' }
        });
        fireDatabase();
      } else {
        fetch(`${ipAddresses.value[0]}/setAlarm`, {
          method: 'post',
          body: JSON.stringify({ id: 'emergency', alarm: 'stop', duration: '10' }),
          headers: { 'Content-Type': 'application/json' }
        });
      }
    }
    refresh();
  });
  
  async function earthquakeDatabase() {
    try {
      const response = await fetch('/api/sensors', {
        method: 'POST',
        body: JSON.stringify({ type: 'earthquake', currentTime: currentDateTime.value }),
        headers: { 'Content-Type': 'application/json' }
      });
      const { value: newHistory } = await response.json();
      console.log(newHistory);
    } catch (error) {
      console.error('Error in earthquakeDatabase:', error);
    }
  }
  
  async function fireDatabase() {
    try {
      const response = await fetch('/api/sensors', {
        method: 'POST',
        body: JSON.stringify({ type: 'fire', currentTime: currentDateTime.value }),
        headers: { 'Content-Type': 'application/json' }
      });
      const { value: newHistory } = await response.json();
      console.log(newHistory);
    } catch (error) {
      console.error('Error in fireDatabase:', error);
    }
  }
  </script>
  
  <style scoped>
  .time {
    position: absolute;
    top: 20px;
    right: 20px;
    color: #000000;
    font-size: 20px;
    font-weight: bold;
    font: caption;
  }
  </style>
  