package com.learn.egames.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)     // auto increment of user id
    private int UserId;
    private String firstName;
    private String LastName;
    @Column(length = 12, name = "Contact")
    private String Contact;
    private String Email;
    private String Password;
    @Column(length = 1500, name ="Address")
    private String Address;
    @Column(name="Type")
    private String Type;
    
    public User() {  }
    
    public User(int UserId, String firstName, String LastName, String Contact, String Email, String Password, String Address, String Type) {
        this.UserId = UserId;
        this.firstName = firstName;
        this.LastName = LastName;
        this.Contact = Contact;
        this.Email = Email;
        this.Password = Password;
        this.Address = Address;
        this.Type = Type;
    }

    public User(String firstName, String LastName, String Contact, String Email, String Password, String Address, String Type) {
        this.firstName = firstName;
        this.LastName = LastName;
        this.Contact = Contact;
        this.Email = Email;
        this.Password = Password;
        this.Address = Address;
        this.Type = Type;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getContact() {
        return Contact;
    }

    public void setContact(String Contact) {
        this.Contact = Contact;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    @Override
    public String toString() {
        return "User{" + "UserId=" + UserId + ", firstName=" + firstName + ", LastName=" + LastName + ", Contact=" + Contact + ", Email=" + Email + ", Password=" + Password + ", Address=" + Address + ", Type=" + Type + '}';
    }
}
