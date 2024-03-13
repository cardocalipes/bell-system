<template>
    <div>
        <h2>{{content}}</h2>

        <form @submit.prevent="submitForm">
            <div>
                <button type="submit">SCHED 1</button>
            </div>

        </form>

        <form @submit.prevent="submitForm2">
            <div>
                <button type="submit">SCHED 2</button>
            </div>

        </form>

        <form @submit.prevent="submitForm3">
            <div>
                <button type="submit">SCHED 3</button>
            </div>

        </form>

        <form @submit.prevent="submitForm4">
            <div>
                <button type="submit">ALARM NOW</button>
            </div>

        </form>

        <form @submit.prevent="submitForm5">
            <div>
                <button type="submit">ALARM STOP</button>
            </div>

        </form>
    </div>
</template>

<script setup>
import { useIntervalFn } from '@vueuse/core' // VueUse helper, install it : npm i @vueuse/core

const { data: content , refresh} = await useFetch('http://192.168.0.65/sensor')

useIntervalFn(() => {
  refresh() // will call the 'todos' endpoint, just above
}, 1000) // call it back every 3s

import { ref } from 'vue'

const formData = ref({
    name: '',
    email: '',
    message: '',
})

const submitForm = async () => {
    const { data: responseData } = await useFetch('http://192.168.0.65/setAlarm', {
        method: 'post',
        body: { 
            id: "2",
            alarm: "12:00:0",
            duration: "10"
        }
    })

    console.log(responseData.value)
}

const submitForm2 = async () => {
    const { data: responseData } = await useFetch('http://192.168.0.65/setAlarm', {
        method: 'post',
        body: { 
            id: "3",
            alarm: "7:15:0",
            duration: "5"
        }
    })

    console.log(responseData.value)
}

const submitForm3 = async () => {
    const { data: responseData } = await useFetch('http://192.168.0.65/setAlarm', {
        method: 'post',
        body: { 
            id: "1",
            alarm: "19:35:0",
            duration: "15"
        }
    })

    console.log(responseData.value)
}
 
const submitForm4 = async () => {
    const { data: responseData } = await useFetch('http://192.168.91.47/setAlarm', {
        method: 'post',
        body: { 
            id: "firstRing",
            alarm: "now",
            duration: "1"
        }
    })

    console.log(responseData.value)
}

const submitForm5 = async () => {
    const { data: responseData } = await useFetch('http://192.168.91.47/setAlarm', {
        method: 'post',
        body: { 
            id: "emergency",
            alarm: "stop",
            duration: "0"
        }
    })

    console.log(responseData.value)
}
</script>
