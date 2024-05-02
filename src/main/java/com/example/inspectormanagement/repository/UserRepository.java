package com.example.inspectormanagement.repository;

import com.example.inspectormanagement.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
   Optional<User> findByName(String name);
   User findByEmail(String email);
   Optional<User> findByPhone(String phone);
}