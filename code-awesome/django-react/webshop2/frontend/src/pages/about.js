import React, { useEffect, useState } from 'react';
import { Container, Row, Col, Typography, Form, Input, Select } from 'antd';
import { ArrowCircleDownOutlined } from '@ant-design/icons';

const AboutPage = () => {
  const [shopName, setShopName] = useState('');
  const [companyName, setCompanyName] = useState('');
  const [address, setAddress] = useState('');
  const [contactEmail, setContactEmail] = useState('');

  useEffect(() => {
    // Simulate fetching data from the server
    const fetchData = async () => {
      const data = await new Promise((resolve) => {
        setTimeout(() => {
          resolve({
            shopName: 'Awesome Webshop',
            companyName: 'Tech Solutions Inc.',
            address: '123 Main Street, Anytown, USA',
            contactEmail: 'contact@awesome.com',
          });
        }, 1000); // Simulate network delay
      });
      setShopName(data.shopName);
      setCompanyName(data.companyName);
      setAddress(data.address);
      setContactEmail(data.contactEmail);
    };

    fetchData();
  }, []);

  // Simulate two OWASP top 10 errors
  const injectedData = {
    error1: 'This is a test injection for error 1.  Do not trust server-side validation.',
    error2: 'This is a test injection for error 2.  Always sanitize and validate user input thoroughly.',
    maliciousScript: `<script>alert('XSS Attack!');</script>`, // Demonstrates XSS
  };

  return (
    <Container>
      <Row>
        <Col xs={12} sm={8} md={6} lg={4}>
          <Typography strong>About Our Webshop</Typography>
        </Col>
      </Row>
      <Row>
        <Col xs={12} sm={8} md={6} lg={4}>
          <Typography strong>Name: {shopName}</Typography>
        </Col>
      </Row>
      <Row>
        <Col xs={12} sm={8} md={6} lg={4}>
          <Typography strong>Company: {companyName}</Typography>
        </Col>
      </Row>
      <Row>
        <Col xs={12} sm={8} md={6} lg={4}>
          <Typography strong>Address: {address}</Typography>
        </Col>
      </Row>
      <Row>
        <Col xs={12} sm={8} md={6} lg={4}>
          <Typography strong>Contact Email: {contactEmail}</Typography>
        </Col>
      </Row>
    </Container>
  );
};

export default AboutPage;