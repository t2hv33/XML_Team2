package dto;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author duy
 */
public class CartDTO {

    private int UID;
    private int PID;
    private String Name;
    private String Image;
    private int Price;
    private int Wantity;
    private int instock;

    public CartDTO(){
    }

    public CartDTO(int UID, int PID, String Name, String Image, int Price, int Wantity, int instock) {
        this.UID = UID;
        this.PID = PID;
        this.Name = Name;
        this.Image = Image;
        this.Price = Price;
        this.Wantity = Wantity;
        this.instock = instock;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public int getWantity() {
        return Wantity;
    }

    public void setWantity(int Wantity) {
        this.Wantity = Wantity;
    }

    public int getInstock() {
        return instock;
    }

    public void setInstock(int instock) {
        this.instock = instock;
    }

    
    

}
