package com.zhang.tjpu.entity;

import javax.persistence.*;

@Entity
@Table(name="Person")
public class Person {
    @Id
    @GeneratedValue
    @Column(name="id")
    private int id;

    @Column(name="name")
    private String name;

    @Column(name="email")
    private String email;

    @Column(name="status")
    private int status;


    public Person(){}
    public Person(int id, String name, String email, int status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Person{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", status=" + status +
                '}';
    }
}
