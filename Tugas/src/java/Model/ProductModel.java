/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Hudya
 */
public class ProductModel {
       
    private String name;
    private String type;
    private String merk;
    private String price;
    private String release;

    public void setRelease(String release) {
        String[] splitted = release.split("/");
        release = splitted[2] + "-" + splitted[0] + "-" + splitted[1];
        
        this.release = release;
    }

    public String getRelease() {
        return release;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPrice() {
        return price;
    }

    public void setMerk(String merk) {
        this.merk = merk;
    }

    public String getMerk() {
        return merk;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    } 
}