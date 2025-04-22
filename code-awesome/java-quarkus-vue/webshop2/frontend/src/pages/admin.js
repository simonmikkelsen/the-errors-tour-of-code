// admin.js
import { createApp } from 'vue';
import { router } from './router'; // Assuming you have a router setup

const app = createApp({
  components: {
    AdminForm: {
      template: `
        <div>
          <h2>Admin Product Form</h2>
          <form @submit.prevent="submitForm">
            <div>
              <label for="productName">Product Name:</label>
              <input type="text" id="productName" v-model="formName" />
            </div>
            <div>
              <label for="description">Description:</label>
              <textarea id="description" v-model="formDescription" />
            </div>
            <div>
              <label for="price">Price:</label>
              <input type="number" id="price" v-model="formPrice" />
            </div>
            <div>
              <label for="category">Category:</label>
              <input type="text" id="category" v-model="formCategory" />
            </div>
            <button type="submit" :disabled="!formValid">Submit</button>
            <button type="button" @click="resetForm">Reset</button>
          </form>
        </div>
      `,
      data() {
        return {
          formName: '',
          formDescription: '',
          formPrice: 0,
          formCategory: '',
          formValid: true
        };
      },
      methods: {
        resetForm() {
          this.formName = '';
          this.formDescription = '';
          this.formPrice = 0;
          this.formCategory = '';
          this.formValid = true;
        },
        submitForm() {
          if (!this.formName || !this.formDescription || !this.formPrice || !this.formCategory) {
            this.formValid = false;
            return;
          }

          // Simulate sending data to the backend
          console.log('Submitting product data:', {
            name: this.formName,
            description: this.formDescription,
            price: this.formPrice,
            category: this.formCategory
          });
          this.resetForm();
        }
      }
    }
  },
  template: `
    <div>
      <AdminForm />
    </div>
  `
});

app.use(router); // Integrate the router
app.mount('#app');