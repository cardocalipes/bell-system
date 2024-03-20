<script setup>
import { ref, onMounted } from 'vue';
import { DateTime } from 'luxon';
import dayjs from "dayjs";

const sched1Data = ref(await useFetch("/api/test/aa").data);
const setSched = dayjs(sched1Data.realtime).format("HH:mm:ss")

const currentDateTime = ref('');
const counter = ref(0);
onMounted(() => {
  setInterval(currentCounter,1000)
});

function currentCounter(){
  if(currentDateTime === setSched) {

    counter += 1;
  }
}

onMounted(() => {

  setInterval(updateDateTime, 1000);

  updateDateTime();
});

function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm');
  currentDateTime.value = formattedDateTime;
}


</script>
<template>
    <div class="time">
      <p>{{ currentDateTime }}</p>
      <p>{{ setSched }}</p>
    </div>
    <div>
      <p>
          {{ counter}}
      </p>
    </div>

  </template>
  

  
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
  