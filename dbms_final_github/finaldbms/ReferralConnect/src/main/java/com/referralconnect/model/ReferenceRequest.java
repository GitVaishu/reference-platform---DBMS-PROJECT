package com.referralconnect.model;
import java.sql.*;
public class ReferenceRequest {
    private int id;
    private String studentEmail;
    private String professionalEmail;
    private String status;
    private Timestamp requestDate;
    private String message;
    private String resumeUrl;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getProfessionalEmail() {
        return professionalEmail;
    }

    public void setProfessionalEmail(String professionalEmail) {
        this.professionalEmail = professionalEmail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getRequestDate() {
        return requestDate;  // This returns a Timestamp
    }

    public void setRequestDate(Timestamp requestDate) {
        this.requestDate = requestDate;  // This accepts a Timestamp
    }


    public String getMessage() {
        return message;  // Getter for message
    }

    public void setMessage(String message) {
        this.message = message;  // Setter for message
    }
    
    public String getResumeUrl() {
        return resumeUrl;
    }

    public void setResumeUrl(String resumeUrl) {
        this.resumeUrl = resumeUrl;
    }
}
