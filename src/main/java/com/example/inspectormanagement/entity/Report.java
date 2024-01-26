package com.example.inspectormanagement.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "report")
public class Report {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @Lob
    @Column(name = "content")
    private byte[] content;

    @ManyToOne
    @JoinColumn(name = "waiting_apart_id", referencedColumnName = "id")
    private WaitingApart waitingApart;

}
