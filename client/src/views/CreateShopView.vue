<template>
  <div class="create-shop">
    <h1>Создание магазина</h1>
    <form @submit.prevent="handleSubmit">
      <!-- Поля формы будут здесь -->
      <button type="submit">Создать магазин</button>
    </form>
  </div>
</template>

<script>
export default {
  name: 'CreateShopView',
  data() {
    return {
      // Сюда добавим реактивные поля позже
    }
  },
  methods: {
    handleSubmit() {
      console.log('Отправка формы')
      // Здесь будет fetch
    }
  }
}
</script>

<style scoped>
.create-shop {
  max-width: 600px;
  margin: 2rem auto;
  padding: 1.5rem;
}
</style>