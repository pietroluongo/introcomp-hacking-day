public class Ball {
    PVector pos;
    float radius;
    PVector vel;
    
    public Ball() {
        pos = new PVector(width/2, height/2);
        vel = new PVector(1, 1);
        vel.mult(3);
        radius = 25;
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
    
    public void checkUpperLowerBounds() {
        if(pos.y > height-(radius/2) - 0.03*height) {
            vel.y *= -1;
            pos.y = height - radius/2 - 0.03*height;
            return;
        }
        if(pos.y < radius/2 + 0.03*height) {
          vel.y *= -1;
          pos.y = radius/2 + 0.03*height;
          return;
        }
        if(pos.x < 10 + width * 0.03125) {
          
          pos.x = 10 + width * 0.03125;
          vel.x *= -1;
        }
        
        if(pos.x > width - 10 - (width * 0.03125)) {
            pos.x = width - 10 - (width * 0.03125);
            vel.x *= -1;
        }
        
    }
    
    public void tick() {
        checkUpperLowerBounds();
        pos.add(vel);
    }
  
}
