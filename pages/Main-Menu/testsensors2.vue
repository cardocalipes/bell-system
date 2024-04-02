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
const currentDateTimeDB = ref('');
//NEED
const schedData = ref();
const filteredData = ref([]);
//NEED
const type = ref();
const ipAddresses = ref([]);


onMounted(() => {
  // Update date and time every second
  setInterval(updateDateTime, 1000);
  // Initial update
  updateDateTime();
  const savedIPs = localStorage.getItem('ipAddresses');
    if (savedIPs) {
      ipAddresses.value = JSON.parse(savedIPs);
    }
    setTimeout(() => {
    const savedSched = localStorage.getItem('selectedSchedule');
    fetchData(savedSched);
    }, 500); // Adjust the delay as needed
});

function updateDateTime() {
  const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('HH:mm:ss');
  const formattedDateTimeDB = DateTime.now().setZone('Asia/Manila').toFormat('yyyy-MM-dd HH:mm:ss');
  currentDateTimeDB.value = formattedDateTimeDB;
  currentDateTime.value = formattedDateTime;
}

//FINAL FUNCTION FOR BELL RING
//make reusable
async function fetchData(savedAPI) {
  console.log(savedAPI);
  console.log("FETCHED DATA SUCCESSFULLY");
  try {
    const response = await useFetch(`/api/${savedAPI}`);
    schedData.value = response.data.value;
    for(const data of response.data.value) {
      filteredData.value.push(dayjs(data.realtime).format("HH:mm:ss"))
    }
  } catch (error) {
    console.error("Error fetching data:", error);
  }
}

const { data, refresh } = useAsyncData('sensor', async () => {
  console.log(ipAddresses.value[3]);
  try {
    // Check if ipAddresses have been initialized
    if (!ipAddresses.value.length) {
      throw new Error("IP addresses not initialized.");
    }
    const [sensor1, sensor2, sensor3, sensor4] = await Promise.all([
      $fetch(`http://${ipAddresses.value[3]}/sensor1`),
      $fetch(`http://${ipAddresses.value[3]}/sensor2`),
      $fetch(`http://${ipAddresses.value[3]}/sensor3`),
      $fetch(`http://${ipAddresses.value[3]}/sensor4`)
    ]);

    return { sensor1, sensor2, sensor3, sensor4 };
  } catch (error) {
    console.error("Error fetching sensor data:", error);
    return { sensor1: 'N/A', sensor2: 'N/A', sensor3: 'N/A', sensor4: 'N/A' }; // Provide default values
  }
});


watch(currentDateTime, (newDateTime, oldDateTime) => {
  const currentTime = dayjs(newDateTime).format("HH:mm:ss");
  const currentIndex = filteredData.value.indexOf(currentDateTime.value);

  if (filteredData.value.includes(currentDateTime.value)) {
    const oddOrEvenCtr = currentIndex % 2; // Check if seconds are odd or even
    const ringId = oddOrEvenCtr === 0 ? "secondRing" : "firstRing"; // Determine ring type based on seconds
    console.log("ID: ", ringId);
      useFetch(`http://${ipAddresses.value[1]}/setAlarm`, {
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
      useFetch(`http://${ipAddresses.value[1]}/setAlarm`, {
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
      useFetch(`http://${ipAddresses.value[1]}/setAlarm`, {
        method: 'post',
        body: {
          id: "emergency",
          alarm: "now",
          duration: "10"
        }
      });
      fireDatabase();
    } else {
      useFetch(`http://${ipAddresses.value[1]}/setAlarm`, {
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
            currentTime: formattedDateTimeDB.value
        }      
    })
    console.log(newHistory);
}

async function fireDatabase(){
  const {data: { value: newHistory}} = await useFetch ('/api/sensors', {
        method: "POST",
        body: {
            type: 'fire',
            currentTime: formattedDateTimeDB.value
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