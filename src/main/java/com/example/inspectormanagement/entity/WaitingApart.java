package com.example.inspectormanagement.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "waiting_apart")
public class WaitingApart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "apart_name", length = 255)
    private String apartName;

    @Column(name = "address", columnDefinition = "TEXT")
    private String address;

    @Column(name = "customer_name", length = 255)
    private String customer_name;

    @Column(name = "register_date")
    private LocalDate register_date;

    @Column(name = "inspection_date")
    private LocalDate inspection_date;

    @Column(name = "area", length = 255)
    private String area;

    @Column(name = "cus_phone", length = 255)
    private String cus_phone;

    @Column(name = "email", length = 255)
    private String email;

    @ManyToOne
    @JoinColumn(name = "inspectorID", referencedColumnName = "id")
    private LoginInspector loginInspector;

    @Column(name = "status" , columnDefinition = "TEXT")
    private String status;

    @PrePersist
    protected void onCreate() {
        register_date = LocalDate.now();}


}