<template>
  <div style="max-width: 400px; margin: 50px auto; padding: 20px; border: 1px solid #ccc">
    <h2>Регистрация</h2>
    <input v-model="name" placeholder="Имя" style="width: 100%; margin: 8px 0; padding: 8px" />
    <input v-model="email" placeholder="Email" type="email" style="width: 100%; margin: 8px 0; padding: 8px" />
    <input v-model="password" placeholder="Пароль" type="password" style="width: 100%; margin: 8px 0; padding: 8px" />
    <input v-model="password_confirmation" placeholder="Подтверждение пароля" type="password" style="width: 100%; margin: 8px 0; padding: 8px" />
    <button @click="handleRegister" style="width: 100%; padding: 10px; margin-top: 10px">Зарегистрироваться</button>
    <p v-if="error" style="color: red">{{ error }}</p>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useAuth } from '@/composables/useAuth';

const name = ref('');
const email = ref('');
const password = ref('');
const password_confirmation = ref('');
const error = ref('');

const { register } = useAuth();

const handleRegister = async () => {
  if (password.value !== password_confirmation.value) {
    error.value = 'Пароли не совпадают';
    return;
  }
  const result = await register(name.value, email.value, password.value, password_confirmation.value);
  if (!result.success) {
    error.value = result.error;
  } else {
    error.value = '';
    // Можно перенаправить: router.push('/dashboard')
  }
};
</script>