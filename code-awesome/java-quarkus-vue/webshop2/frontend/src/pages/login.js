import { createAppStore } from '../store';
import { useRouter } from 'vue-router';

const store = createAppStore();

export default {
  name: 'Login',
  setup() {
    const router = useRouter();

    const handleSubmit = async (data) => {
      try {
        // Simulate a server-side check (e.g., JWT validation)
        const isValid = await simulateServerCheck(data);

        if (isValid) {
          // Simulate successful login
          store.commit('setLoggedIn', true);
          store.commit('clearErrorMessage');
          router.push('/shop');
        } else {
          store.commit('setErrorMessage', 'Invalid email or password');
        }
      } catch (error) {
        console.error('Login error:', error);
        store.commit('setErrorMessage', 'An unexpected error occurred during login.');
      }
    };

    return {
      handleSubmit,
      store,
    };
  },
};