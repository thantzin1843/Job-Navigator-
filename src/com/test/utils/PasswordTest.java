package com.test.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class PasswordTest {
    public static void main(String[] args) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        
        // Simulate the raw password
        String rawPassword = "1234";
        
        // Simulate encoding the raw password
        String encodedPassword = "$2a$10$eykPIRJwrPz8qJPTxL/PCeGgY1k5PKMo/2zgCth49eV8WesxQdP22"; // Example encoded password from DB
        
        boolean matches = passwordEncoder.matches(rawPassword, encodedPassword);
        System.out.println("Password matches: " + matches);
    }
}
