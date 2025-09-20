// File: profile.java
// Part of: super_dating
// Backend: Spring Boot
// Language: Java 12
// Database: MySQL
// Frontend: React

package com.example.super_dating.backend.src.pages;

import com.example.super_dating.backend.entity.Profile;
import com.example.super_dating.backend.repository.ProfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {

    @Autowired
    private ProfileRepository profileRepository;

    @GetMapping("/profile/{profileId}")
    public String getProfile(@PathVariable("profileId") int profileId, Model model) {
        Profile profile = profileRepository.findById(profileId).orElse(null);

        if (profile == null) {
            return "error"; // Handle case where profile is not found
        }

        model.addAttribute("profile", profile);
        return "profile"; // Render the profile page
    }
}