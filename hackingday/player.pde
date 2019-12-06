public class Player {
    final int id;
    PVector pos;
    float sizeX;
    float sizeY;
    float moveTick = 20;
    int score;
    public Player(int id) {
        this.id = id;
        this.sizeX = width * 0.03125;
        this.sizeY = height * 0.260;
        if(id == 0) {
            pos = new PVector(10, 10);
        }
        else if(id == 1) {
            pos = new PVector(width - (sizeX + 10), 10);
        }
        this.score = 0;
    }
    
    public void moveX(float amount) {
        if(game.gamestate == "PAUSED")
            return;
        this.pos.x += amount;
    }
    
    public void moveY(float amount) {
        if(game.gamestate == "PAUSED")
            return;
        if(pos.y + sizeY + amount > height || pos.y + amount < 0)
            return;
        this.pos.y += amount;
        
    }

    public void moveUp() {
        this.moveY(-moveTick);
    }
    public void moveDown() {
        this.moveY(moveTick);
    }

    public void draw() {
        rect(pos.x, pos.y, sizeX, sizeY);
    }
    
    public void addPoint() {
        this.score++;
    }

    public void gogo_analog(float tgt) {
        pos.y = map(tgt, 0, 1023, 0.03 * height, height - 0.03*height - sizeY);
    }

}
