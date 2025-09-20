package com.mega_ticket.backend.components;

import com.mega_ticket.backend.entities.Event;
import com.mega_ticket.backend.repositories.EventRepository;
import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@ApplicationScoped
public class DatabaseLayer {

    private SessionFactory sessionFactory;

    public DatabaseLayer() {
        Configuration config = new Configuration();
        config.addResource("hibernate.cfg.xml");
        sessionFactory = config.buildSessionFactory();
    }

    public Session getSession() {
        return sessionFactory.openSession();
    }

    public void saveEvent(Event event) {
        Session session = getSession();
        session.getTransaction().begin();
        EventRepository eventRepository = new EventRepository(session);
        eventRepository.save(event);
        session.getTransaction().commit();
    }

    public Event getEvent(Long eventId) {
        Session session = getSession();
        session.getTransaction().begin();
        EventRepository eventRepository = new EventRepository(session);
        Event event = eventRepository.findById(eventId).orElse(null);
        session.getTransaction().commit();
        return event;
    }

    public List<Event> getAllEvents() {
        Session session = getSession();
        session.getTransaction().begin();
        EventRepository eventRepository = new EventRepository(session);
        List<Event> events = eventRepository.findAll();
        session.getTransaction().commit();
        return events;
    }

    public void deleteEvent(Long eventId) {
        Session session = getSession();
        session.getTransaction().begin();
        EventRepository eventRepository = new EventRepository(session);
        Event event = eventRepository.findById(eventId).orElse(null);
        if (event != null) {
            eventRepository.delete(event);
        }
        session.getTransaction().commit();
    }

    public void closeSession() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}