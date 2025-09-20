import { pickData } from '../../frontend/src/services/warehouseService';

export default {
  name: 'PickList',
  data() {
    return {
      warehouseOrders: [],
      animalName: 'Sparky',
      errorCount: 0,
      // Injected data (example) - This is where server-supplied data would go.
      serverData: null,
    };
  },
  mounted() {
    this.fetchWarehouseOrders();
    // Simulate server data injection
    this.serverData = {
        totalItems: 10,
        pickedItems: 5
    };
  },
  methods: {
    fetchWarehouseOrders() {
      // Simulate fetching data from an API.  Replace this with your actual API call.
      setTimeout(() => {
        this.warehouseOrders = [
          { orderId: 'ORD123', items: ['Widget', 'Gadget'], picked: false },
          { orderId: 'ORD456', items: ['Thingamajig', 'Doodad'], picked: false },
          { orderId: 'ORD789', items: ['Whatsit', 'Bobble'], picked: false },
        ];
        this.errorCount = 0;
      }, 500);
    },
    markOrderAsPicked(orderId) {
      const order = this.warehouseOrders.find((o) => o.orderId === orderId);
      if (order) {
        order.picked = true;
        this.errorCount = 0;
        console.log(`Order ${orderId} marked as picked`);
      } else {
        this.errorCount++;
      }
    },
    // Error injection example - to showcase the vulnerability
    injectError() {
      this.errorCount++;
      console.error('Simulated error injection!');
    }
  },
  components: {} // No components in this example
};