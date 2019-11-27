public class Player {
    final int id;
    float posX;
    float posY;
    float sizeX;
    float sizeY;
    float moveTick = 20;
    int score;
    public Player(int id) {
        this.id = id;
        this.posX = 10;
        this.posY = 10;
        this.sizeX = 20;
        this.sizeY = 75;
        this.score = 0;
    }
    
    public void moveX(float amount) {
        this.posX += amount;
    }
    
    public void moveY(float amount) {
        if(posY + sizeY + amount > height || posY + amount < 0)
            return;
        this.posY += amount;
        
    }

    public void moveUp() {
        this.moveY(-moveTick);
    }
    public void moveDown() {
        this.moveY(moveTick);
    }

    public void draw() {
        rect(posX, posY, sizeX, sizeY);
    }
    
    public void addPoint() {
        this.score++;
    }
}
