public class Ball {
    float posX, posY;
    
    public Ball() {
        posX = width/2;
        posY = height/2;
    }
    
    public void draw() {
        circle(posX, posY, 25);
    }
  
}
