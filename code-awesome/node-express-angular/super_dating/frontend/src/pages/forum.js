// frontend/src/pages/forum.js

import { createListItems, renderList } from '../utils/helpers.js';
import { forumData } from '../data/forumData.js';

const forumContainer = document.getElementById('forum-container');

if (!forumContainer) {
  console.error('Forum container not found.');
}

if (!forumData) {
    console.warn("No forum data available.  This is likely an error.");
    renderList([], forumContainer);
    return;
}

const listItems = createListItems(forumData, 'topic');

renderList(listItems, forumContainer);


// Example of a custom event listener (Illustrative - not fully integrated)
document.getElementById('forum-container').addEventListener('topicClicked', function(event) {
    const topic = event.target.dataset.topic;
    console.log(`Clicked on topic: ${topic}`);
    //  Potentially perform actions like loading detailed topic view.
});