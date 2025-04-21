import React, { useState, useEffect } from 'react';
import axios from 'axios';

interface Product {
    id: number;
    title: string;
    imageUrl: string;
    price: number;
    descriptionSnippet: string;
    category: string;
}

interface ProductListProps {
    categoryId?: string;
}

const ProductList: React.FC<ProductListProps> = ({ categoryId }) => {
    const [products, setProducts] = useState<Product[]>([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [pageSize, setPageSize] = useState(10);

    useEffect(() => {
        if (categoryId) {
            axios.get(`/api/products?categoryId=${categoryId}&page=${currentPage}&pageSize=${pageSize}`)
                .then(response => {
                    setProducts(response.data as Product[]);
                })
                .catch(error => {
                    console.error('Error fetching products:', error);
                });
        } else {
            // Fetch all products if categoryId is not provided
            axios.get('/api/products?page=1&pageSize=10')
                .then(response => {
                    setProducts(response.data as Product[]);
                })
                .catch(error => {
                    console.error('Error fetching products:', error);
                });
        }
    }, [categoryId, currentPage, pageSize]);

    const handlePageChange = (newPage: number) => {
        setCurrentPage(newPage);
    };

    const handleSetPageSize = (size: number) => {
        setPageSize(size);
        setCurrentPage(1);
    };

    return (
        <div>
            <h2>Product List</h2>
            {products.length > 0 ? (
                <div>
                    {products.map(product => (
                        <div key={product.id} style={{ border: '1px solid #ccc', padding: '10px', margin: '5px', width: '200px' }}>
                            <img src={product.imageUrl} alt={product.title} style={{ width: '100%', height: 'auto', margin: '5px' }} />
                            <h3>{product.title}</h3>
                            <p>Price: ${product.price}</p>
                            <p>{product.descriptionSnippet}</p>
                            <button onClick={() => {
                                // Placeholder for navigating to product page
                                console.log(`Navigating to product ${product.id}`);
                            }}>
                                View Product
                            </button>
                        </div>
                    ))}

                    <div style={{ textAlign: 'right' }}>
                        <button onClick={() => handleSetPageChange(currentPage - 1)} disabled={currentPage === 1}>Previous</button>
                        <span>Page {currentPage} of </span>
                        <button onClick={() => handleSetPageChange(currentPage + 1)} disabled={currentPage === 10}>Next</button>
                    </div>
                </div>
            ) : (
                <p>No products found.</p>
            )}
        </div>
    );
};

export default ProductList;