<template>
  <div class="time">
    <p>{{ currentDateTime }}</p>
  </div>
  <div>
    <h2>{{ data.sensor1 }}</h2>
    <h2>{{ data.sensor2 }}</h2>
    <h2>{{ data.sensor3 }}</h2>
    <h2>{{ data.sensor4 }}</h2>
    <p>
      {{ filteredData }}
    </p>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue';
import { DateTime } from 'luxon';
import dayjs from "dayjs";

const currentDateTime = ref('');
//NEED
const schedData = ref();
const filteredData = ref([]);
//NEED
const type = ref();


onMounted(() => {
  // Update date and time every second
  setInterval(updateDateTime, 1000);
  // Initial update
  updateDateTime();
});

function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm:ss');
  currentDateTime.value = formattedDateTime;
}

//FINAL FUNCTION FOR BELL RING
//make reusable
async function fetchData() {
  console.log("FETCHED DATA SUCCESSFULLY");
  try {
    const response = await useFetch("/api/schedthree");
    schedData.value = response.data.value;
    for(const data of response.data.value) {
      filteredData.value.push(dayjs(data.realtime).format("HH:mm:ss"))
    }
  } catch (error) {
    console.error("Error fetching data:", error);
  }
}

const { data, refresh } = useAsyncData('sensor', async () => {
  const [sensor1, sensor2, sensor3, sensor4] = await Promise.all([
    $fetch('http://192.168.0.216/sensor1'),
    $fetch('http://192.168.0.216/sensor2'),
    $fetch('http://192.168.0.216/sensor3'),
    $fetch('http://192.168.0.216/sensor4')
  ]);

  return { sensor1, sensor2, sensor3, sensor4 };
});

fetchData();
watch(currentDateTime, (newDateTime, oldDateTime) => {
  const currentTime = dayjs(newDateTime).format("HH:mm:ss");
  const currentIndex = filteredData.value.indexOf(currentDateTime.value);

  if (filteredData.value.includes(currentDateTime.value)) {
    console.log("HAHA: ", currentIndex);
    console.log("TEST");
    const oddOrEvenCtr = currentIndex % 2; // Check if seconds are odd or even
    const ringId = oddOrEvenCtr === 0 ? "secondRing" : "firstRing"; // Determine ring type based on seconds
    console.log("ID: ", ringId);
      useFetch('http://192.168.0.65/setAlarm', {
        method: 'post',
        body: {
          id: ringId,
          alarm: "now",
          duration: "2"
        }
      });
  } else {
    console.log(filteredData);
    if (data.value.sensor1.s1 == "active" && data.value.sensor2.s2 == "active" && data.value.sensor3.s3 == "active" && data.value.sensor4.s4 == "active") {
      useFetch('http://192.168.0.65/setAlarm', {
        method: 'post',
        body: {
          id: "emergency",
          alarm: "now",
          duration: "15"
        }
      });
      earthquakeDatabase();
    } 
    
    else if (data.value.sensor1.s1 == "active_fire") {
      useFetch('http://192.168.0.65/setAlarm', {
        method: 'post',
        body: {
          id: "emergency",
          alarm: "now",
          duration: "10"
        }
      });
      fireDatabase();
    } else {
      useFetch('http://192.168.0.65/setAlarm', {
        method: 'post',
        body: {
          id: "emergency",
          alarm: "stop",
          duration: "10"
        }
      });
    }
  }
  refresh();
});


async function earthquakeDatabase(){
  const {data: { value: newHistory}} = await useFetch ('/api/sensors', {
        method: "POST",
        body: {
            type: 'earthquake',
            currentTime: currentTime.value
        }      
    })
    console.log(newHistory);
}

async function fireDatabase(){
  const {data: { value: newHistory}} = await useFetch ('/api/sensors', {
        method: "POST",
        body: {
            type: 'fire',
            currentTime: currentTime.value
        }      
    })
    console.log(newHistory);
}
//END

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