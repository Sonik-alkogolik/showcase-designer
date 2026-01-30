// client/src/composables/useAuth.js
import { ref } from 'vue';
import axios from 'axios';

const token = ref(localStorage.getItem('auth_token') || null);

// Устанавливаем токен при инициализации, если он есть
if (token.value) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${token.value}`;
}

export const useAuth = () => {
  const login = async (email, password) => {
    try {
      const response = await axios.post('/api/login', { email, password });
      const newToken = response.data.token;
      localStorage.setItem('auth_token', newToken);
      token.value = newToken;
      axios.defaults.headers.common['Authorization'] = `Bearer ${newToken}`;
      return { success: true };
    } catch (error) {
      return { success: false, error: error.response?.data?.message || 'Ошибка входа' };
    }
  };

  const register = async (name, email, password, password_confirmation) => {
    try {
      const response = await axios.post('/api/register', {
        name,
        email,
        password,
        password_confirmation,
      });
      const newToken = response.data.token;
      localStorage.setItem('auth_token', newToken);
      token.value = newToken;
      axios.defaults.headers.common['Authorization'] = `Bearer ${newToken}`;
      return { success: true };
    } catch (error) {
      return { success: false, error: error.response?.data?.message || 'Ошибка регистрации' };
    }
  };

  const logout = async () => {
    try {
      await axios.post('/api/logout');
    } catch (e) {
      console.warn('Logout error:', e);
    }
    localStorage.removeItem('auth_token');
    delete axios.defaults.headers.common['Authorization'];
    token.value = null;
  };

  return { token, login, register, logout };
};