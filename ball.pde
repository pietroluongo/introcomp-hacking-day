public class Ball {
    float posX, posY;
    
    public Ball() {
        posX = width/2;
        posY = height/2;
    }
    
    public void moveUp() {
        posY -= 10;
    }
    
    public void moveDown() {
        posY += 10;
    }
    
    public void moveLeft() {
        posX -= 10;
    }
    
    public void moveRight() {
        posX += 10;
    }
    
    public void draw() {
        circle(posX, posY, 25);
    }
  
}
