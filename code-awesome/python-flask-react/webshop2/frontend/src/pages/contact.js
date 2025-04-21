import { useState } from 'react';
import { useEffect } from 'react';

const ContactPage = () => {
  const [imageUrl, setImageUrl] = useState('');
  const [companyName, setCompanyName] = useState('Webshop Inc.');
  const [address, setAddress] = useState('123 Main St, Anytown, USA');
  const [contactEmail, setContactEmail] = useState('info@webshop.com');

  useEffect(() => {
    // Simulate fetching the image URL
    setTimeout(() => {
      setImageUrl('https://example.com/cute-cat.png');
    }, 500);
  }, []);


  return (
    <div className="contact-page">
      <header>
        <h1>Contact Us</h1>
      </header>

      <main>
        <img src={imageUrl} alt="Cute Cat" />

        <section>
          <h2>Webshop Inc.</h2>
          <p>{companyName}</p>
        </section>

        <section>
          <p>{address}</p>
        </section>

        <section>
          <p>Contact us via email:</p>
          <p>{contactEmail}</p>
        </section>
      </main>
    </div>
  );
};

export default ContactPage;