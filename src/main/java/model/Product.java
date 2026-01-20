package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String url_image;

    public Product() {

    }
    public Product(int id, String name, double price, String url_image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.url_image = url_image;
    }
    public Product( String name, double price, String url_image) {

        this.name = name;
        this.price = price;
        this.url_image = url_image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getUrl_image() {
        return url_image;
    }

    public void setUrl_image(String url_image) {
        this.url_image = url_image;
    }
}
