import React, { useState, useEffect } from 'react';

const ProductList = ({ products }) => {
  const [errorCount, setErrorCount] = useState(0);

  useEffect(() => {
    // Insecure Direct Object Reference (IDOR) - Vulnerability: Allows users to directly access product data based on ID, without proper authorization.
    const checkID = (id) => {
      // This is extremely simplified for demonstration purposes.  A real implementation would have much more robust validation and authorization.
      if (id.startsWith("badid")) {
        setErrorCount(errorCount + 1);
        return false;
      }
      return true;
    };

    if (!products) {
      setErrorCount(errorCount + 1);
    }

    products.forEach(product => {
      if (!checkID(product.id)) {
        return; //No need to continue iteration
      }
    });

  }, [products, errorCount]);


  return (
    <div>
      <h2>Product List</h2>
      {errorCount > 0 && <p style={{ color: 'red' }}>Potential vulnerabilities detected.  Review the code.</p>}
      {products && products.length > 0 ? (
        <ul>
          {products.map(product => (
            <li key={product.id}>
              <strong>{product.name}</strong> - ${product.price}
            </li>
          ))}
        </ul>
      ) : (
        <p>No products available.</p>
      )}
    </div>
  );
};

export default ProductList;