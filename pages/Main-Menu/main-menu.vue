<template>
    <div class="menu-container">
    <div class="time">
      <h4>{{ currentDateTime }}</h4>
    </div>
        <div>
            <div class="menu-item" onclick="goToSchedulePage()">
                <router-link :to="{ path: '/Main-Menu/Pick-Schedule/pick-sched' }"><span class="menu-icon">&#x1F4C5;</span></router-link> 
                <router-link :to="{ path: '/Main-Menu/Pick-Schedule/pick-sched' }"><div class="menu-label">Pick Schedule</div></router-link>
            </div>
            <div class="menu-item" onclick="goToHistoryPage()">
                <span class="menu-icon"><NuxtLink to = "/Main-Menu/History/history-page">&#x1F4DD;</NuxtLink></span>
                <div class="menu-label"><NuxtLink to = "/Main-Menu/History/history-page">History</NuxtLink></div>
            </div>
        </div>
        <div>
            <div class="menu-item" onclick="goToCustomSchedulePage()">
                <span class="menu-icon"><NuxtLink to = "/Main-Menu/Custom-Schedule/custom-sched">&#x1F4C3;</NuxtLink></span>
                <div class="menu-label"><NuxtLink to = "/Main-Menu/Custom-Schedule/custom-sched">Custom Schedule</NuxtLink></div>
            </div>
            <div class="menu-item" onclick="logOut()">
                <span class="menu-icon"><NuxtLink to = "/signout">&#x1F6AA;</NuxtLink></span>
                <div class="menu-label"><NuxtLink to = "/signout">Log Out</NuxtLink></div>
            </div>
        </div>
    </div>
</template>

<script setup>
        function goToSchedulePage() {
            // Redirect to the "Pick Schedule" page
            //window.location.href = "/Main-Menu/Pick-Schedule/pick-sched";
        }

        function goToCustomSchedulePage() {
            // Redirect to the "Custom Schedule" page
            //window.location.href = "/Main-Menu/Pick-Schedule/pick-sched";
        }

        function goToHistoryPage() {
            // Redirect to the "History" page
            window.location.href = "/Main-Menu/History/history-page";
        }

        function logOut() {
            // Redirect to the logout page or perform logout action
            window.location.href = "logout.html";
        }

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
        const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('yyyy-MM-dd HH:mm:ss');
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
      $fetch(`http://${ipAddresses.value[0]}/sensor1`),
      $fetch(`http://${ipAddresses.value[1]}/sensor2`),
      $fetch(`http://${ipAddresses.value[2]}/sensor3`),
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
    const ringId = oddOrEvenCtr === 0 ? "firstRing" : "secondRing"; // Determine ring type based on seconds
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


async function earthquakeDatabase() {
  try {
    const response = await useFetch('/api/sensors', {
      method: 'POST',
      body: {
        type: 'earthquake',
        currentTime: currentDateTimeDB.value // Use currentDateTimeDB for timestamp
      }
    });
    console.log('Earthquake data sent:', response.data);
  } catch (error) {
    console.error('Error sending earthquake data:', error);
  }
}

async function fireDatabase() {
  try {
    const response = await useFetch('/api/sensors', {
      method: 'POST',
      body: {
        type: 'fire',
        currentTime: currentDateTimeDB.value // Use currentDateTimeDB for timestamp
      }
    });
    console.log('Fire data sent:', response.data);
  } catch (error) {
    console.error('Error sending fire data:', error);
  }
}

//END
</script>

<style scoped>
body {
            background-color: #f2f2f2;
        }
        .menu-container {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            margin: 0 auto;

            background-image: url('~/public/images/bg.png');
            background-size: cover;
            background-position: center;
            height: 100vh;
             background-repeat: no-repeat;
        }
        .menu-item {
            text-align: center;
            height: 145px;
            width: 250px;
            margin: 0 auto;
            margin: 45px;
            padding: 40px 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: transform 0.2s;
        }
        .menu-item:hover {
            transform: scale(1.05);
        }
        .menu-icon {
            font-size: 80px;
        }
        .menu-label {
            font-weight: bold;
            font: caption;
            font-size: 20px;
        }
        .time {
          position: absolute;
          top: 13px;
          right: 58px;
          color: #000000;
          font-size: 50px;
          font: caption;
        }
</style>
