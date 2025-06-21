package com.referralconnect.model;

public class Student {
    private String name, email, password, resumeUrl, experience, photoUrl;
    private int studentId;
    public Student() {}
    public Student(String name, String email, String password, String resumeUrl, String experience, String photoUrl) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.resumeUrl = resumeUrl;
        this.experience = experience;
        this.photoUrl = photoUrl;
    }

    // Getters
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public String getResumeUrl() { return resumeUrl; }
    public String getExperience() { return experience; }
    public String getPhotoUrl() { return photoUrl; }
    public int getstudentId() { return studentId; }
    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setResumeUrl(String resumeUrl) {
        this.resumeUrl = resumeUrl;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }
    
    public void setstudentId(int studentId) { this.studentId = studentId; }
}
