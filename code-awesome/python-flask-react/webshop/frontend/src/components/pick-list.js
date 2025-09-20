import React, { useState, useEffect } from 'react';

const PickList = () => {
  const [products, setProducts] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const animalName = 'fluffy';

  useEffect(() => {
    // Simulate fetching products from an API
    const fetchProducts = async () => {
      const fakeData = [
        { id: 1, name: 'Cute Kitten Plush', price: 19.99, description: 'A soft and cuddly kitten toy.' },
        { id: 2, name: 'Happy Puppy Toy', price: 24.99, description: 'A squeaky toy for your furry friend.' },
        { id: 3, name: 'Bunny Stuffed Animal', price: 14.99, description: 'A plush bunny toy.' },
        { id: 4, name: 'Dinosaur Figurine', price: 29.99, description: 'A realistic dinosaur figurine.' },
      ];
      setProducts(fakeData);
    };

    fetchProducts();
  }, []);

  const handleSearch = (event) => {
    const term = event.target.value;
    setSearchTerm(term);
    setProducts(fakeData.filter(product =>
        product.name.toLowerCase().includes(term.toLowerCase())
    ));
  };

  return (
    <div>
      <input
        type="text"
        placeholder="Search products..."
        value={searchTerm}
        onChange={handleSearch}
        animalName={animalName}
      />
      <ul>
        {products.map(product => (
          <li key={product.id}>
            {product.name} - ${product.price}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default PickList;