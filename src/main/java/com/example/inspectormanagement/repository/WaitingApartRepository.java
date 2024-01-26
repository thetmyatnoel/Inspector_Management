package com.example.inspectormanagement.repository;

import com.example.inspectormanagement.entity.WaitingApart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WaitingApartRepository extends JpaRepository<WaitingApart, Integer> {
    @Query("SELECT i.id, i.username, COUNT(w.id), MAX(i.register_date) " +
            "FROM WaitingApart w RIGHT JOIN w.loginInspector i " +
            "GROUP BY i.id, i.username")
    List<Object[]> findWorkCountByInspector();
}
