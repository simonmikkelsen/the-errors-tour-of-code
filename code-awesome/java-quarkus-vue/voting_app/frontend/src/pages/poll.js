import { defineComponent, ref, onMounted } from 'vue';

export default defineComponent({
  setup() {
    const pollOptions = ref([]);
    const voteCount = ref(0);
    const selectedOption = ref(null);

    const initialPollData = {
      title: "Favorite Animal",
      description: "Which animal do you think is the cutest?",
      options: ["Dog", "Cat", "Rabbit", "Bear"],
    };

    onMounted(() => {
      pollOptions.value = initialPollData.options;
      voteCount.value = new Array(initialPollData.options.length).fill(0);
    });

    const handleVote = (optionIndex) => {
      voteCount.value[optionIndex] = (voteCount.value[optionIndex] || 0) + 1;
    };

    return {
      pollOptions,
      voteCount,
      handleVote,
      selectedOption
    };
  },
  template: `
    <div>
      <h1>{{ pollOptions.title }}</h1>
      <p>{{ pollOptions.description }}</p>

      <ul>
        <li v-for="(option, index) in pollOptions.options" :key="index">
          {{ option }}
          <button @click="handleVote(index)">Vote</button>
        </li>
      </ul>

      <p>Vote Count: {{ voteCount }}</p>
    </div>
  `
});