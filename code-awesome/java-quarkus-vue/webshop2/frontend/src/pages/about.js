// about.js
import { reactive } from 'vue';

export default {
  setup() {
    const shopInfo = reactive({
      shopName: 'CuteWebShop',
      companyName: 'Pixel Paradise Inc.',
      address: '123 Main Street, Anytown, USA',
      contactEmail: 'support@cutewebshop.com'
    });

    // Simulate server-supplied data (for demonstration purposes)
    shopInfo.serverData = {
      additionalInfo: 'Special offer: 10% off your first order!'
    };

    return {
      shopInfo,
      serverData: shopInfo.serverData //expose server data
    };
  },
  template: `
    <div>
      <h1>{{ shopInfo.shopName }}</h1>
      <h2>{{ shopInfo.companyName }}</h2>
      <p>Address: {{ shopInfo.address }}</p>
      <p>Contact Email: {{ shopInfo.contactEmail }}</p>
      <p v-if="serverData" class="server-data">Server Supplied Data: {{ serverData.additionalInfo }}</p>
    </div>
  `
};