package com.referralconnect.model;

public class Professional {
    private String name;
    private String email;
    private String password;
    private String organization;
    private String field;
    private int professionalId;

    public Professional() {}

    public Professional(String name, String email, String password, String organization, String field) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.organization = organization;
        this.field = field;
       
    }

    // Getters and setters
    public int getProfessionalId() { return professionalId; }
    public void setProfessionalId(int professionalId) { this.professionalId = professionalId; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getOrganization() { return organization; }
    public void setOrganization(String organization) { this.organization = organization; }

    public String getField() { return field; }
    public void setField(String field) { this.field = field; }
}
