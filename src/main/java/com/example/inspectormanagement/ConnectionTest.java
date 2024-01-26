package com.example.inspectormanagement;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
@Component

public class ConnectionTest implements CommandLineRunner {

    private final DataSource dataSource;

    public ConnectionTest(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    @Override
    public void run(String... args) throws Exception {
        try (Connection connection = dataSource.getConnection()) {
            System.out.println("Successfully connected to MariaDB: " + connection.getCatalog());
        } catch (Exception e) {
            System.out.println("Error connecting to MariaDB: " + e.getMessage());
        }
    }
}