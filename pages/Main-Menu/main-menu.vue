<template>
    <div class="menu-container">
        <div>
            <div class="menu-item" onclick="goToSchedulePage()">
                <router-link :to="{ path: '/Main-Menu/Pick-Schedule/pick-sched' }"><span class="menu-icon">&#x1F4C5;</span></router-link> 
                <router-link :to="{ path: '/Main-Menu/Pick-Schedule/pick-sched' }"><div class="menu-label">Pick Schedule</div></router-link>
            </div>
            <div class="menu-item" onclick="goToHistoryPage()">
                <span class="menu-icon">&#x1F4DD;</span>
                <div class="menu-label">History</div>
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
            window.location.href = "history.html";
        }

        function logOut() {
            // Redirect to the logout page or perform logout action
            window.location.href = "logout.html";
        }
</script>

<style scoped>
body {
            background-color: #f2f2f2;
        }
        .menu-container {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            height: 97.3vh;
            margin: 0 auto;

            background-image: url('~/public/images/bg.png');
            background-size: 1260px 600px;
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
</style>
