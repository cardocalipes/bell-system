<template>
    <div class="settings">
      <h2>Settings</h2>
      <div v-for="(input, index) in inputs" :key="index" class="input-group">
        <label>{{`IP Address ${index + 1}`}}</label>
        <input v-model="input.value" @input="validateInput(index)" placeholder="Enter IP address">
        <span v-if="errors[index]" class="error">{{errors[index]}}</span>
      </div>
      <button @click="saveSettings">Save</button>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        inputs: [
          { value: '' },
          { value: '' },
          { value: '' },
          { value: '' }
        ],
        errors: ['', '', '', '']
      };
    },
    methods: {
      validateInput(index) {
        const ip = this.inputs[index].value;
        if (!/^(\d{1,3}\.){3}\d{1,3}$/.test(ip)) {
          this.errors[index] = 'Invalid IP address';
        } else {
          this.errors[index] = '';
        }
      },
      //also this
      saveSettings() {
        // Example: save to localStorage
        localStorage.setItem('ipAddresses', JSON.stringify(this.inputs.map(input => input.value)));
        alert('Settings saved!');
      }
    },
    mounted() {
      // Load settings from localStorage if available
      const savedIPs = localStorage.getItem('ipAddresses');
      if (savedIPs) {
        this.inputs = JSON.parse(savedIPs).map(value => ({ value }));
      }
    }
  };
  </script>
  
  <style scoped>
  .settings {
    max-width: 400px;
    margin: 0 auto;
  }
  
  .input-group {
    margin-bottom: 1rem;
  }
  
  .error {
    color: red;
  }
  </style>
  