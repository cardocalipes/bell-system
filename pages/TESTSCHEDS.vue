<!-- pages/schedule1.vue -->

<template>
    <div>
        <h1> Current Time: {{currentDateTime}}</h1>
    </div>
    <div>
        <h1>Schedule 1</h1>
        <pre>
            {{ filtered1Data }}
        </pre>
        <h2>Ring Type:</h2>
        <p id="Schedule-1-type">N/A</p>
        <h2>Status:</h2>
        <p id="Schedule-1-status">Inactive</p> <!-- insert status for sched1-->
    </div>
    <div>
        <h1>Schedule 2</h1>
        <pre>
            {{ filtered2Data }}
        </pre>
        <h2>Ring Type:</h2>
        <p id="Schedule-2-type">N/A</p>
        <h2>Status:</h2>
        <p id="Schedule-2-status">Inactive</p> <!-- insert status for sched2-->
    </div>
    <div>
        <h1>Schedule 3</h1>
        <pre>
            {{ filtered3Data }}
        </pre>
        <h2>Ring Type:</h2>
        <p id="Schedule-3-type">N/A</p>
        <h2>Status:</h2>
        <p id="Schedule-3-status">Inactive</p> <!-- insert status for sched3-->
    </div>
  </template>
  
<script setup>
    import { ref, onMounted } from 'vue';
    import { DateTime } from 'luxon';
    import dayjs from "dayjs";
    import utc from "dayjs/plugin/utc";
    dayjs.extend(utc);

    const sched1Data = ref();
    const sched2Data = ref();
    const sched3Data = ref();
    const filtered1Data = ref([]);
    const filtered2Data = ref([]);
    const filtered3Data = ref([]);
    const currentDateTime = ref('');
    onMounted(() => {
    // Update date and time every second
    setInterval(updateDateTime, 1000);
    // Initial update
    updateDateTime();
    });

    function updateDateTime() {
    const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm');
    currentDateTime.value = formattedDateTime;
    }

    async function fetchData1() {
    try {
        const response = await useFetch("/api/sched");
        sched1Data.value = response.data.value;
        for(const data of response.data.value) {
            filtered1Data.value.push(dayjs(data.realtime).format("HH:mm"))
        }
    } catch (error) {
        console.error("Error fetching data:", error);
    }
    }
    async function fetchData2() {
    try {
        const response = await useFetch("/api/schedtwo");
        sched2Data.value = response.data.value;
        for(const data of response.data.value) {
            filtered2Data.value.push(dayjs(data.realtime).format("HH:mm"))
        }
    } catch (error) {
        console.error("Error fetching data:", error);
    }
    }
    async function fetchData3() {
    try {
        const response = await useFetch("/api/schedthree");
        sched3Data.value = response.data.value;
        for(const data of response.data.value) {
            filtered3Data.value.push(dayjs(data.realtime).format("HH:mm"))
        }
    } catch (error) {
        console.error("Error fetching data:", error);
    }
    }

    fetchData1();
    fetchData2();
    fetchData3();

    // Watch for changes in currentDateTime and update status accordingly
    watch(currentDateTime, (newDateTime, oldDateTime) => {
    checkStatus(newDateTime, filtered1Data.value, 'Schedule 1');
    checkStatus(newDateTime, filtered2Data.value, 'Schedule 2');
    checkStatus(newDateTime, filtered3Data.value, 'Schedule 3');
  });

  function checkStatus(currentTime, scheduleTimes, scheduleName) {
  const currentIndex = scheduleTimes.findIndex(time => time === currentTime);
  const statusElement = document.querySelector(`#${scheduleName.replace(' ', '-')}-status`);
  const ringTypeElement = document.querySelector(`#${scheduleName.replace(' ', '-')}-type`);

  if (statusElement && ringTypeElement) {
    if (currentIndex !== -1) {
      const ringType = (currentIndex % 2 === 0) ? 'Second Ring' : 'First Ring';
      statusElement.textContent = 'Active';
      ringTypeElement.textContent = `Ring Type: ${ringType}`;
    } else {
      statusElement.textContent = 'Inactive';
      ringTypeElement.textContent = 'Ring Type: N/A';
    }
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