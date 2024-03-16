export default {
  components: true,
  server: {
    port: process.env.PORT || 3000,
    host: '0.0.0.0',
  },

  auth: {
    strategies: {
      local: {
        token: {
          property: 'token',
          global: true,
          required: true,
          type: 'Bearer'
        },
        user: {
          property: 'user',
          autoFetch: true
        },
        endpoints: {
          login: { url: '/api/auth/login', method: 'post' },
          logout: false, // Customize logout behavior if needed
          user: { url: '/api/auth/user', method: 'get' }
        }
      }
    },
    redirect: {
      login: '/login',
      logout: '/',
      home: '/dashboard'
    }
  },

  // Plugins to load before mounting the App
  plugins: [{ src: '~/plugins/auth.js', ssr: false }],
}