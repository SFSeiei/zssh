package com.zhang.tjpu.dao;

import com.zhang.tjpu.entity.Person;
import java.util.List;

public interface PersonDao {
    Person getPerson(String id);

    List<Person> getAllPerson();

    void addPerson(Person person);

    boolean delPerson(String id);

    boolean updatePerson(Person person);

    List<Person> getAllPerson(int page,int pageSize);
}