public class Ball {
    PVector pos;
    float radius;
    PVector vel;
    Player p1;
    Player p2;
    boolean canMove;

    public Ball(Player p1, Player p2) {
        reset();
        radius = 25;
        this.p1 = p1;
        this.p2 = p2;
    }

    public void reset() {
        pos = new PVector(width/2, height/2);
        vel = new PVector(1, 1);
        vel.mult(3);
        canMove = false;
    }

    public void toggleMovement() {
        canMove = !canMove;
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
        //fill(0, 101, 255);
        circle(pos.x, pos.y, 25);
        fill(255);
    }
    
    public void checkBounds() {
        // Checagem de se a bola passou de uma das bordas - Pontuação!
        if(pos.x < (0 - radius - 10)) {
            game.notify("P2_SCORED");
            reset();
            return;
        }
        if(pos.x > (width + radius + 10)) {
            game.notify("P1_SCORED");
            reset();
            return;
        }

        // Checagem de se a bola bate no topo ou na margem inferior do campo
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

        // Checagem que rola quando a bola bate na linha de ação de um dos players
        if(pos.x < 10 + width * 0.03125 + radius/2) {
          checkPlayerCollision(p1);
          return;
        }
        if(pos.x > width - 10 - (width * 0.03125) - radius/2) {
            checkPlayerCollision(p2);
            return;
        }
    }
    
    public void tick() {
        if(game.gamestate == "INGAME") {
            checkBounds();
            pos.add(vel);
        }
    }

    public void checkPlayerCollision(Player p) {
        if(pos.y > p.pos.y && pos.y < p.pos.y + p.sizeY) {
            vel.x *= -1;
            this.vel.mult(1.1);
        }
    }
  
}
