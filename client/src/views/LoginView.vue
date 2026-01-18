<template>
  <div style="max-width: 400px; margin: 50px auto; padding: 20px; border: 1px solid #ccc">
    <h2>Вход</h2>
    <input v-model="email" placeholder="Email" type="email" style="width: 100%; margin: 8px 0; padding: 8px" />
    <input v-model="password" placeholder="Пароль" type="password" style="width: 100%; margin: 8px 0; padding: 8px" />
    <button @click="handleLogin" style="width: 100%; padding: 10px; margin-top: 10px">Войти</button>
    <p v-if="error" style="color: red">{{ error }}</p>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useAuth } from '@/composables/useAuth';

const email = ref('');
const password = ref('');
const error = ref('');

const { login } = useAuth();

const handleLogin = async () => {
  const result = await login(email.value, password.value);
  if (!result.success) {
    error.value = result.error;
  } else {
    error.value = '';
    // Можно перенаправить, например: router.push('/dashboard')
  }
};
</script>