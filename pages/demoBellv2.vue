<template>
    <div class="time">
      <p>{{ currentDateTime }}</p>
    </div>
    <div>
        <h2>{{data.sensor1}}</h2>

        <h2>{{data.sensor2}}</h2>

        <h2>{{data.sensor3}}</h2>

        <h2>{{data.sensor4}}</h2>

    </div>
</template>

<script setup>
        import { ref, onMounted } from 'vue';
        import { DateTime } from 'luxon';
        import dayjs from "dayjs";

        let oddOrEvenCtr = 1;

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
        
//Copy and paste in every page        
import { useIntervalFn } from '@vueuse/core' // VueUse helper, install it : npm i @vueuse/core

const { data , refresh } = await useAsyncData('sensor', async () => {
  const [sensor1, sensor2, sensor3, sensor4] = await Promise.all([
    //setup sensor1 ip address first otherwise it will come out as null
    $fetch('http://192.168.64.82/sensor1'), //192.168.0.8 swapped
    $fetch('http://192.168.64.47/sensor2'), //192.168.0.65 swapped
    $fetch('http://192.168.64.209/sensor3'), //192.168.0.201
    $fetch('http://192.168.64.94/sensor4') //192.168.0.216
    //if an esp does not have an mq135 sensor, just use the normal bell system code (no sensor) because if it is uploaded with the fire sensor there are Mq_UPDATE spikes since the pins
    //assigned to the sensor is available, even hand interference causes a spike
  ])

  return { sensor1, sensor2, sensor3, sensor4 }
})

useIntervalFn(() => {//start of loop for webpage

    if (data.value.sensor1.s1 == "active" && data.value.sensor2.s2 == "active" && data.value.sensor3.s3 == "active" && data.value.sensor4.s4 == "active") {
        useFetch('http://192.168.64.47/setAlarm', {
            //send data to history "earthquake ring at current time"
                method: 'post',
                body: { 
                    id: "emergency",
                    alarm: "now",
                    duration: "15"
                }
            })
    }
     //provide additional case for fire sensor
    else if(data.value.sensor1.s1 == "active_fire"){
        useFetch('http://192.168.64.47/setAlarm', {
            //send data to history "fire ring at current time"
                method: 'post',
                body: { 
                    id: "emergency",
                    alarm: "now",
                    duration: "10"
                }
            })
    }
    else if(currentDateTime.value in filteredData){
        const indexOfTime = filteredData.indexOf(currentDateTime.value);
        if (indexOfTime % 2 == 0){
            useFetch('http://192.168.64.47/setAlarm', {
                method: 'post',
                body: { 
                    id: "firstRing",
                    alarm: "now",
                    duration: "2"
                }
            })
        }else {
            useFetch('http://192.168.64.47/setAlarm', {
                method: 'post',
                body: { 
                    id: "secondRing",
                    alarm: "now",
                    duration: "2"
                }
            })
        }
    }
    else{
        useFetch('http://192.168.64.47/setAlarm', {
                method: 'post',
                body: { 
                    id: "emergency",
                    alarm: "stop",
                    duration: "10"
                }
            })
        }
    //types of id -> emergency and time | firstRing and secondRing
    //types of alarm -> now and stop
    // in the ifs statement in the firstRing and secondRing, set values for id to emergency and alarm to stop
  refresh() // will call the 'todos' endpoint, just above
}, 750) // end of loop
    const sched1Data = ref();
    const filteredData = ref([]);

    async function fetchData() {
    try {
        const response = await useFetch("/api/sched");
        sched1Data.value = response.data.value;
        for(const data of response.data.value) {
            filteredData.value.push(dayjs(data.realtime).format("HH:mm"))
        }
    } catch (error) {
        console.error("Error fetching data:", error);
    }
}

fetchData();


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