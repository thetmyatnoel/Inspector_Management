package com.example.inspectormanagement.repository;

import com.example.inspectormanagement.entity.LoginInspector;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LoginInspectorRepository extends JpaRepository<LoginInspector, Integer> {
}
