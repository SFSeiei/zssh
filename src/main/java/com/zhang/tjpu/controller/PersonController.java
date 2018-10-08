package com.zhang.tjpu.controller;

import com.zhang.tjpu.entity.Person;
import com.zhang.tjpu.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@Controller
public class PersonController {

    @Autowired
    private PersonService personService;

    @RequestMapping("/getAllPerson")
    public String getAllPerson(HttpServletRequest request){

        request.setAttribute("personList", personService.getAllPerson());

        return "/index";
    }

    @RequestMapping("/getPerson")
    public String getPerson(String id,HttpServletRequest request){

        request.setAttribute("person", personService.getPerson(id));

        return "/editPerson";
    }
    @RequestMapping("/getAllPersonByStatus")
    public String getAllPersonByStatus(HttpServletRequest request){
        int page=1;
        int pageSize=10;
        request.setAttribute("personList",personService.getAllPerson(page,pageSize));

        return "/selectByStatus";
    }

    @RequestMapping("/toAddPerson")
    public String toAddPerson(){
        return "/addPerson";
    }

    @RequestMapping("/addPerson")
    public String addPerson(Person person, HttpServletRequest request){

        personService.addPerson(person);

        return "redirect:/getAllPerson";
    }
    @RequestMapping("/addPersonAndSee")
    public String addPersonAndSee(Person person, HttpServletRequest request){

        personService.addPerson(person);
        return "redirect:/getAllPersonByStatus";
    }
    @RequestMapping("/delPerson")
    public void delPerson(String id,HttpServletResponse response){

        String result = "{\"result\":\"error\"}";

        if(personService.delPerson(id)){
            result = "{\"result\":\"success\"}";
        }

        response.setContentType("application/json");

        try {
            PrintWriter out = response.getWriter();
            out.write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updatePerson")
    public String updatePerson(Person person,HttpServletRequest request){

        if(personService.updatePerson(person)){
            person = personService.getPerson(String.valueOf(person.getId()));
            request.setAttribute("person", person);
            return "redirect:/getAllPerson";
        }else{
            return "/error";
        }
    }
}