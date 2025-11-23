package com.example.demo.controller;
 
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
 
@CrossOrigin(origins = "http://deploy-frontend-3101.s3-website.us-east-2.amazonaws.com/") // <-- This fixes CORS error
@RestController
public class HomeController {
 
    @GetMapping("/")
    public String home() {
        return "Welcome to Spring Boot WAR Deployment on EC2!, I hope you are doing well";
    }
 
    @GetMapping("/hello")
    public String hello() {
        return "Hello from EC2 US-east2 Spring Boot App!";
    }
}
 
