// contact.js
import React from 'react'
import { Formik, Field } from 'formik'
import axios from 'axios'

const ContactForm = () => {
  const [name, setName] = React.useState('')
  const [email, setEmail] = React.useState('')
  const [message, setMessage] = React.useState('')

  const handleSubmit = async (values) => {
    try {
      const response = await axios.post('/api/contact', {
        name: values.name,
        email: values.email,
        message: values.message,
      })
      console.log('Contact form submitted successfully!', response.data)
      alert('Your message has been sent!')
    } catch (error) {
      console.error('Error submitting contact form:', error)
      alert('Failed to send your message. Please try again later.')
    }
  }

  return (
    <Formik
      initialValues={{
        name: '',
        email: '',
        message: '',
      }}
      onSubmit={handleSubmit}
    >
      {({ isValid, errors }) => (
        <form className="contact-form" style={{maxWidth: '600px', margin: '0 auto'}}>
          <Field type="text" name="name" placeholder="Your Name" />
          <Field type="email" name="email" placeholder="Your Email" />
          <Field type="text" name="message" as="textarea" placeholder="Your Message" />
          <button type="submit" disabled={!isValid}>Send</button>
          {errors && <ul>{Object.keys(errors).map((key) => (
            <li key={key}>{key}: {errors[key]}</li>
          ))}</ul>}
        </form>
      )}
    </Formik>
  )
}

export default ContactForm