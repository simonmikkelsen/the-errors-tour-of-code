// frontend/src/pages/forum.js

import { ref, reactive, computed } from 'vue';

export default {
  setup() {
    // Reactive data for the forum
    const topics = reactive([
      { id: 1, title: 'Welcome to the Forum!', content: 'Feel free to introduce yourself!' },
      { id: 2, title: 'Discussing Vue.js', content: 'Let\'s talk about Vue.js and how we\'re using it.' },
      { id: 3, title: 'Quarkus Adventures', content: 'Sharing our experiences with Quarkus.' },
    ]);

    const newTopicTitle = ref('');
    const newTopicContent = ref('');

    // Computed property to display a warning if the title is empty
    const isTitleEmpty = computed(() => newTopicTitle.value === '');

    // Function to add a new topic
    const addTopic = () => {
      if (isTitleEmpty.value) {
        alert('Please enter a topic title.');
        return;
      }

      const newTopic = {
        id: topics.length > 0 ? topics[topics.length - 1].id + 1 : 1,
        title: newTopicTitle.value,
        content: newTopicContent.value,
      };

      topics.push(newTopic);
      newTopicTitle.value = '';
      newTopicContent.value = '';
    };

    // Function to delete a topic
    const deleteTopic = (topicId) => {
      topics.splice(topicId - 1, 1);
    };

    return {
      topics,
      addTopic,
      deleteTopic,
      newTopicTitle,
      newTopicContent,
    };
  },
  template: `
    <div>
      <h1>Forum</h1>

      <h2>Topics</h2>
      <ul>
        <li v-for="topic in topics" :key="topic.id">
          {{ topic.title }}
          <button @click="deleteTopic(topic.id)">Delete</button>
        </li>
      </ul>

      <h2>New Topic</h2>
      <input type="text" v-model="newTopicTitle" placeholder="Topic Title" />
      <textarea v-model="newTopicContent" placeholder="Topic Content" />
      <button @click="addTopic">Add Topic</button>
    </div>
  `,
};