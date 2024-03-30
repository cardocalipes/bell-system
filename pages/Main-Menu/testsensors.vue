<template>
    <div class="container">
      <h1>Saved IP Addresses</h1>
      <p>
        {{ ipAddresses[1] }}
      </p>
      <ul>
        <li v-for="(ip, index) in ipAddresses" :key="index">{{ ip }}</li>
      </ul>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  
  const ipAddresses = ref([]);
  
  onMounted(() => {
    // Retrieve saved IP addresses from localStorage
    //use this
    const savedIPs = localStorage.getItem('ipAddresses');
    if (savedIPs) {
      ipAddresses.value = JSON.parse(savedIPs);
    }
  });
  </script>
  
  <style>
  .container {
    max-width: 600px;
    margin: 0 auto;
  }
  
  ul {
    list-style-type: none;
    padding: 0;
  }
  
  li {
    margin-bottom: 10px;
    background-color: #f0f0f0;
    padding: 10px;
    border-radius: 5px;
  }
  </style>
  