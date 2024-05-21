<template>
    <div class="signout-container">
      <div v-if="signingOut" class="loading-message">Signing out...</div>
      <div v-else class="confirmation-message">You have been signed out successfully.</div>
    </div>
  </template>
  
  <script setup lang="ts">
  import { ref, onMounted } from 'vue'
  import { useRouter } from 'vue-router'
  
  const signingOut = ref(true)
  const { signOut } = useAuth()
  const router = useRouter()
  
  onMounted(async () => {
    await signOut()
    signingOut.value = false
    setTimeout(() => {
      router.push('/') // Redirect to the index page after sign out
    }, 2000) // Adjust the delay as needed
  })
  </script>
  
  <style scoped>
  .signout-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #e0f7fa;
    text-align: center;
  }
  
  .loading-message,
  .confirmation-message {
    font-size: 1.5rem;
    color: #007bb5;
  }
  </style>
  