<template>
    <div>
        <h2>{{data.sensor1}}</h2>

        <h2>{{data.sensor2}}</h2>

        <h2>{{data.sensor3}}</h2>

        <h2>{{data.sensor4}}</h2>

    </div>
</template>

<script setup>
import { useIntervalFn } from '@vueuse/core' // VueUse helper, install it : npm i @vueuse/core

const { data , refresh } = await useAsyncData('sensor', async () => {
  const [sensor1, sensor2, sensor3, sensor4] = await Promise.all([
    //setup sensor1 ip address first otherwise it will come out as null
    $fetch('http://192.168.0.8/sensor1'), //192.168.0.8 swapped
    $fetch('http://192.168.0.65/sensor2'), //192.168.0.65 swapped
    $fetch('http://192.168.0.201/sensor3'), //192.168.0.201
    $fetch('http://192.168.0.214/sensor4') //192.168.0.214
  ])

  return { sensor1, sensor2, sensor3, sensor4 }
})

useIntervalFn(() => {

    if (data.value.sensor1.s1 == "active" && data.value.sensor2.s2 == "active" && data.value.sensor3.s3 == "active" && data.value.sensor4.s4 == "active") {
        useFetch('http://192.168.0.65/setAlarm', {
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
        useFetch('http://192.168.0.65/setAlarm', {
                method: 'post',
                body: { 
                    id: "emergency",
                    alarm: "now",
                    duration: "15"
                }
            })
    }
    //Option 1: get data from database and compare to current time for it to ring
    // else if(current time == time from schedu from database){
    //     useFetch('http://192.168.0.65/setAlarm', {
    //             method: 'post',
    //             body: { 
    //                 id: "1 2 or 3",
    //                 alarm: "now",
    //                 duration: "15"
    //             }
    //         })
    // }
    else {
        useFetch('http://192.168.0.65/setAlarm', {
                method: 'post',
                body: { 
                    id: "emergency",
                    alarm: "stop",
                    duration: "0"
                }
            })
    }
  refresh() // will call the 'todos' endpoint, just above
}, 3000) // call it back every 3s


</script>
