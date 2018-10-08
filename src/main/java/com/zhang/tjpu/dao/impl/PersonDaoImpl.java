package com.zhang.tjpu.dao.impl;

import com.zhang.tjpu.dao.PersonDao;
import com.zhang.tjpu.entity.Person;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
@Transactional
public class PersonDaoImpl implements PersonDao {
    @Autowired
    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sesssionFactory) {
        this.sessionFactory=sesssionFactory;
    }
    public Person getPerson(String id){
        String hql ="from Person p where p.id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,id);
        return (Person)query.uniqueResult();
    }

    public List<Person> getAllPerson() {
        String hql = "from Person ";
        Query query =sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }

    public void addPerson(Person person){
        sessionFactory.getCurrentSession().save(person);
    }

    public boolean delPerson(String id){
        String hql = "delete Person p where p.id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,id);
        return (query.executeUpdate()>0);
    }
    public boolean updatePerson(Person person){
        String hql = "update Person p set p.name = ? where p.id = ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,person.getName());
        query.setString(1,String.valueOf(person.getId()));
        return (query.executeUpdate() > 0);
    }

    public List<Person> getAllPerson(int page, int pageSize) {
        String hql ="FROM Person ";
        return sessionFactory.getCurrentSession().createQuery(hql)
                .setFirstResult((page-1)*pageSize).setMaxResults(pageSize).list();
    }
}
