<template>
    <div class="menu-container">
    <div class="time">
      <p>{{ currentDateTime }}</p>
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
                <span class="menu-icon"><NuxtLink to = "/">&#x1F6AA;</NuxtLink></span>
                <div class="menu-label"><NuxtLink to = "/">Log Out</NuxtLink></div>
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

        onMounted(() => {
        // Update date and time every second
        setInterval(updateDateTime, 1000);
        // Initial update
        updateDateTime();
        });

        function updateDateTime() {
        const formattedDateTime = DateTime.now().setZone('Asia/Manila').toFormat('yyyy-MM-dd HH:mm:ss');
        currentDateTime.value = formattedDateTime;
        }
// const schedData = ref();
// const filteredData = ref([]);
// //FINAL FUNCTION FOR BELL RING
// //make reusable
// async function fetchData() {
//   console.log("FETCHED DATA SUCCESSFULLY");
//   try {
//     const response = await useFetch("/api/schedthree");
//     schedData.value = response.data.value;
//     for(const data of response.data.value) {
//       filteredData.value.push(dayjs(data.realtime).format("HH:mm:ss"))
//     }
//   } catch (error) {
//     console.error("Error fetching data:", error);
//   }
// }

// const { data, refresh } = useAsyncData('sensor', async () => {
//   const [sensor1, sensor2, sensor3, sensor4] = await Promise.all([
//     $fetch('http://192.168.0.8/sensor1'),
//     $fetch('http://192.168.0.65/sensor2'),
//     $fetch('http://192.168.0.201/sensor3'),
//     $fetch('http://192.168.0.214/sensor4')
//   ]);

//   return { sensor1, sensor2, sensor3, sensor4 };
// });

// fetchData();
// watch(currentDateTime, (newDateTime, oldDateTime) => {
//   const currentTime = dayjs(newDateTime).format("HH:mm:ss");
//   const currentIndex = filteredData.value.indexOf(currentDateTime.value);

//   if (filteredData.value.includes(currentDateTime.value)) {
//     console.log("HAHA: ", currentIndex);
//     console.log("TEST");
//     const oddOrEvenCtr = currentIndex % 2; // Check if seconds are odd or even
//     const ringId = oddOrEvenCtr === 0 ? "secondRing" : "firstRing"; // Determine ring type based on seconds
//     console.log("ID: ", ringId);
//       useFetch('http://192.168.0.65/setAlarm', {
//         method: 'post',
//         body: {
//           id: ringId,
//           alarm: "now",
//           duration: "2"
//         }
//       });
//   } else {
//     console.log(filteredData);
//     if (data.value.sensor1.s1 == "active" && data.value.sensor2.s2 == "active" && data.value.sensor3.s3 == "active" && data.value.sensor4.s4 == "active") {
//       useFetch('http://192.168.0.65/setAlarm', {
//         method: 'post',
//         body: {
//           id: "emergency",
//           alarm: "now",
//           duration: "15"
//         }
//       });
//       earthquakeDatabase();
//     } 
    
//     else if (data.value.sensor1.s1 == "active_fire") {
//       useFetch('http://192.168.0.65/setAlarm', {
//         method: 'post',
//         body: {
//           id: "emergency",
//           alarm: "now",
//           duration: "10"
//         }
//       });
//       fireDatabase();
//     } else {
//       useFetch('http://192.168.0.65/setAlarm', {
//         method: 'post',
//         body: {
//           id: "emergency",
//           alarm: "stop",
//           duration: "10"
//         }
//       });
//     }
//   }
//   refresh();
// });


// async function earthquakeDatabase(){
//   const {data: { value: newHistory}} = await useFetch ('/api/sensors', {
//         method: "POST",
//         body: {
//             type: 'earthquake',
//             currentTime: currentTime.value
//         }      
//     })
//     console.log(newHistory);
// }

// async function fireDatabase(){
//   const {data: { value: newHistory}} = await useFetch ('/api/sensors', {
//         method: "POST",
//         body: {
//             type: 'fire',
//             currentTime: currentTime.value
//         }      
//     })
//     console.log(newHistory);
// }
// //END
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
          top: 20px;
          right: 20px;
          color: #000000;
          font-size: 20px;
          font-weight: bold;
          font: caption;
        }
</style>
