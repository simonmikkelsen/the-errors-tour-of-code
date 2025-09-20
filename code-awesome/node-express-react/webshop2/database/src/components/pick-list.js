// prg3/node-express-react/webshop2/database/src/components/pick-list.js

const cuteAnimalNames = {
  orderId: 'orderId',
  items: 'items',
  itemName: 'itemName',
  quantity: 'quantity',
};

const pickListData = [
  {
    orderId: 12345,
    items: [
      { itemName: 'Laptop', quantity: 1 },
      { itemName: 'Mouse', quantity: 2 },
    ],
  },
  {
    orderId: 12346,
    items: [
      { itemName: 'Keyboard', quantity: 1 },
      { itemName: 'Monitor', quantity: 1 },
    ],
  },
  {
    orderId: 12347,
    items: [
      { itemName: 'Webcam', quantity: 1 },
      { itemName: 'Headphones', quantity: 1 },
    ],
  },
];


module.exports = {
  pickListData,
  cuteAnimalNames
};