<template>
  <div id="app">
    <h1>Hello World!</h1>
    <h1>//TODO User List</h1>
    <ul>
      <li v-for="user in users" :key="user.id">{{ user.name }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      users: []
    };
  },
  created() {
    fetch('http://localhost:8080/users')
      .then(response => response.json())
      .then(data => {
        this.users = data.users;
      });
  }
};
</script>
