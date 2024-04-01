<template>
  <div class="container">
    <div class="time">
      <p>{{ currentDateTime }}</p>
    </div>
    <div class="header">
      <h1>SAVED SCHEDULES</h1>
    </div>

    <div class="schedule-container">
      <ul class="back-button">
        <li><router-link to="/Main-Menu/Custom-Schedule/custom-sched">Back</router-link></li>
      </ul>
      <div class="schedule-column" @click="applySchedule('customsched1')" :class="{ 'highlighted': selectedSchedule === 'customsched1' }">CustomSched1</div>
      <div class="schedule-column" @click="applySchedule('customsched2')" :class="{ 'highlighted': selectedSchedule === 'customsched2' }">CustomSched2</div>
      <div class="schedule-column" @click="applySchedule('customsched3')" :class="{ 'highlighted': selectedSchedule === 'customsched3' }">CustomSched3</div>
      <div class="schedule-column" @click="applySchedule('customsched4')" :class="{ 'highlighted': selectedSchedule === 'customsched4' }">CustomSched4</div>
      <div class="schedule-column" @click="applySchedule('customsched5')" :class="{ 'highlighted': selectedSchedule === 'customsched5' }">CustomSched5</div>
      <div class="schedule-column" @click="applySchedule('customsched6')" :class="{ 'highlighted': selectedSchedule === 'customsched6' }">CustomSched6</div>
      <div class="schedule-column" @click="applySchedule('customsched7')" :class="{ 'highlighted': selectedSchedule === 'customsched7' }">CustomSched7</div>
      <div class="schedule-column" @click="applySchedule('customsched8')" :class="{ 'highlighted': selectedSchedule === 'customsched8' }">CustomSched8</div>
      <div class="schedule-column" @click="applySchedule('customsched9')" :class="{ 'highlighted': selectedSchedule === 'customsched9' }">CustomSched9</div>
      <div class="schedule-column" @click="applySchedule('customsched10')" :class="{ 'highlighted': selectedSchedule === 'customsched10' }">CustomSched10</div>
      <div class="buttons">
        <button @click="applyClickedSchedule">Apply</button>
        <button @click="deleteSchedule">Delete</button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import { DateTime } from 'luxon';

export default {
  setup() {
    const currentDateTime = ref('');
    const selectedSchedule = ref(null);

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

    function applySchedule(databaseName) {
      selectedSchedule.value = databaseName;
      console.log(selectedSchedule.value);
    }

    function applyClickedSchedule() {
      if (selectedSchedule.value) {
        alert(`Applying schedule: ${selectedSchedule.value}`);
        localStorage.setItem('selectedSchedule', selectedSchedule.value);
        // Redirect to the view page
        window.location.href = '/view';
      } else {
        alert("Please select a schedule to apply.");
      }
    }

    function deleteSchedule() {
      if (selectedSchedule.value) {
        alert(`Deleting schedule: ${selectedSchedule.value}`);
        // Reset selected schedule after deletion
        selectedSchedule.value = null;
      } else {
        alert("Please select a schedule to delete.");
      }
    }

    return {
      currentDateTime,
      selectedSchedule,
      applySchedule,
      applyClickedSchedule,
      deleteSchedule
    };
  }
};
</script>

<style scoped>
.container {
  background-image: url('~/public/images/bg.png');
  background-size: cover;
  background-position: center;
  height: 100vh;
  background-repeat: no-repeat; 
  background-attachment: fixed;
  position: relative;
}

.back-button {
  position: absolute;
  top: 10px;
  left: 10px;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 20px 20px;
  cursor: pointer;
  font: caption;
  font-size: 20px;
}

.schedule-container {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  grid-gap: 20px; /* Adjusted gap */
  align-items: center;
  width: 90%;
  margin: 0 auto;
  background-color: #b7d9ff;
  margin: 25px;
  padding: 100px 50px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.schedule-column {
  border: 1px solid #ccc;
  padding: 20px;
  cursor: pointer;
  text-align: center;
  background-color: #f9f9f9;
}

.schedule-column.highlighted {
  background-color: #33cc33;
}

.schedule-column:hover {
  background-color: #e0e0e0;
}

.buttons {
  grid-column: 1 / span 5; /* Span all columns */
  text-align: center;
  margin-top: 20px;
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
