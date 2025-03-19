package model;

public class Hotel {
    private int hotelID;
    private String name;
    private String address;
    private String phone;
    private String email;
    private String description;
    private String image; // Thêm thuộc tính image

    public Hotel() {
    }

    public Hotel(int hotelID, String name, String address, String phone, String email, String description, String image) {
        this.hotelID = hotelID;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.description = description;
        this.image = image;
    }

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "hotelID=" + hotelID +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}

