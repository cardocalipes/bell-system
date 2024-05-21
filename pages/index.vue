<script setup lang="ts">
const { status, signIn, signOut } = useAuth()
const router = useRouter()

const loggedIn = computed(() => status.value === 'authenticated')

async function handleSignIn() {
  await signIn('github')
}

async function handleSignOut() {
  await signOut()
}

// Watch for changes in authentication status to redirect after login
watchEffect(() => {
  if (loggedIn.value) {
    router.push('/settings')  // Replace '/next-page' with your desired route
  }
})
</script>

<template>
  <div class="auth-container">
    <button v-if="loggedIn" @click="handleSignOut" class="auth-button">
      Sign Out
    </button>
    <button v-else @click="handleSignIn" class="auth-button">
      Login with GitHub
    </button>
  </div>
</template>

<style scoped>
.auth-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #e0f7fa;
}

.auth-button {
  background-color: #007bb5;
  color: #ffffff;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
  transition: background-color 0.3s ease;
  margin: 0 0.5rem;
}

.auth-button:hover {
  background-color: #005f87;
}
</style>
