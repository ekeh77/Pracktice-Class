package PKG_IOC;

public class Car {

   private Tire carTire;
   
   public void setTire(Tire carTire) {
      this.carTire = carTire;
   }
   
   public void getTire() {
      this.carTire.tireKind();
   }
}
