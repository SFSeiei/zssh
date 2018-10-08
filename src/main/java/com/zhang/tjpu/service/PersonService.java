package com.zhang.tjpu.service;

import com.zhang.tjpu.entity.Person;

import java.util.List;

public interface PersonService {
    Person getPerson(String id);

    List<Person> getAllPerson();

    void addPerson(Person person);

    boolean delPerson(String id);

    boolean updatePerson(Person person);

    List<Person> getAllPerson(int page,int pageSize);
}
