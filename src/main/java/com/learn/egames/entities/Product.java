package com.learn.egames.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)     // auto increment of product id
    private int ProductId;
    private String Title;
    @Column(length =1500, name="Description")
    private String Description;
    private String Photo; 
    private int Price;
    private int Discount;
    private int Quantity;

    @ManyToOne
    private Category category;
    
    public Product() {   }

    public Product(String Title, String Description, String Photo, int Price, int Discount, int Quantity, Category category) {
        this.Title = Title;
        this.Description = Description;
        this.Photo = Photo;
        this.Price = Price;
        this.Discount = Discount;
        this.Quantity = Quantity;
        this.category= category;
    }       

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
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

    public String getPhoto() {
        return Photo;
    }

    public void setPhoto(String Photo) {
        this.Photo = Photo;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public double getDiscount() {
        return Discount;
    }

    public void setDiscount(int Discount) {
        this.Discount = Discount;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "ProductId=" + ProductId + ", Title=" + Title + ", Description=" + Description + ", Photo=" + Photo + ", Price=" + Price + ", Discount=" + Discount + ", Quantity=" + Quantity + ", category=" + category + '}';
    }
    
    
    // Calculate price after discount
    
    public int getPriceAfterDiscount(){
        
        int d= (int) ((this.getDiscount()/100.0)* this.getPrice());
        return (int) (this.getPrice() -d);
    }
    
}
