package com.example.inspectormanagement.repository;

import com.example.inspectormanagement.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ReportRepository extends JpaRepository<Report, Integer> {
    Optional<Report> findByWaitingApartId(int waitingApartId);
}
