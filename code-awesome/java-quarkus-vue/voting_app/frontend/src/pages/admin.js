import { createApp } from 'vue';
import VueRouter from 'vue-router';
import AdminForm from '../components/AdminForm.vue';

const app = createApp({
    components: {
        AdminForm
    },
    router: VueRouter
});

app.router.push({
    path: '/admin',
    component: AdminForm,
    query: {
        pollTitle: '',
        pollDescription: '',
        pollOptions: ''
    }
});

app.mount('#app');