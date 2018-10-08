package com.zhang.tjpu.service.impl;

import com.zhang.tjpu.dao.PersonDao;
import com.zhang.tjpu.entity.Person;
import com.zhang.tjpu.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    private PersonDao personDao;

    public Person getPerson(String id) {
        return personDao.getPerson(id);
    }

    public List<Person> getAllPerson(){
        List<Person> list = personDao.getAllPerson();
        return list;
    }

    public void addPerson(Person person){
        personDao.addPerson(person);
    }

    public boolean delPerson(String id){
        return personDao.delPerson(id);
    }

    public boolean updatePerson(Person person){
        return personDao.updatePerson(person);
    }

    public List<Person> getAllPerson(int page, int pageSize) {
        List<Person> list =personDao.getAllPerson(page,pageSize);
        return list;
    }
}
