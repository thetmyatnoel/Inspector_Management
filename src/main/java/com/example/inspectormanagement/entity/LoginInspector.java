package com.example.inspectormanagement.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;


@Data
@Entity
@Table(name = "login_inspector")
public class LoginInspector {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, length = 255)
    private String username;

    @Column(nullable = false, length = 255)
    private String password;

    @Column(name = "register_date")
    private LocalDate register_date;

    @Column(name = "email", length = 255)
    private String email;
    @PrePersist
    protected void onCreate() {
        register_date = LocalDate.now();}
}
