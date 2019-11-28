public class Ball {
    PVector pos;
    public Ball() {
        pos = new PVector(width/2, height/2);
    }
    
    public void moveUp() {
        pos.y -= 10;
    }
    
    public void moveDown() {
        pos.y += 10;
    }
    
    public void moveLeft() {
        pos.x -= 10;
    }
    
    public void moveRight() {
        pos.x += 10;
    }
    
    public void draw() {
        circle(pos.x, pos.y, 25);
    }
  
}
