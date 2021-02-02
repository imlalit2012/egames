package com.learn.egames.entities;

import java.util.*;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)     // auto increment of Category id
    private int CategoryId;
    private String Title;
    @Column(length =1500, name="Description")
    private String Description;

    @OneToMany(mappedBy ="category")
    private List<Product>products = new ArrayList<>();
    
    public Category() { }

    public Category(int CategoryId, String Title, String Description) {
        this.CategoryId = CategoryId;
        this.Title = Title;
        this.Description = Description;
    }

    public Category(String Title, String Description,List<Product>products) {
        this.Title = Title;
        this.Description = Description;
        this.products = products;
    }
 
    
    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Category{" + "CategoryId=" + CategoryId + ", Title=" + Title + ", Description=" + Description + ", products=" + products + '}';
    }
    
}
