public class Pong {
    int leftScore;
    int rightScore;
    Player p1;
    Player p2;
    Ball b;
    public Pong() {
      leftScore = 0;
      rightScore = 0;
      p1 = new Player(0);
      p2 = new Player(1);
      b = new Ball();

    }
    public void update() {
      p1.draw();
      p2.draw();
      b.draw();
      drawBoundaries();
      drawScore();
    }
    
    public void drawScore() {
        textAlign(CENTER);
        String scr = p1.score + " x " + p2.score;
        text(scr, width/2, 0.104 * height);
    }
    
    public void drawBoundaries() {
        rect(0, 0, width, 0.03*height);
        rect(0, height-0.03*height, width, 0.03*height);
    }
    public void readKey(int key) {
        System.out.println(key);
        switch(key) {
            case 38:
            // up
                p1.moveUp();
                break;
            case 40:
            // down
                p1.moveDown();
                break;
            case 87:
                p2.moveUp();
                break;
            case 83:
                p2.moveDown();
                break;
            // DEBUG PONTUAÇÃO
            case 37:
                //ponto do esquerdo
                p1.addPoint();
                break;
            case 39:
                p2.addPoint();
                break;
            // DEBUG BOLA
            case 73:
                b.moveUp();
                break;
            case 74:
                b.moveLeft();
                break;
            case 75:
                b.moveDown();
                break;
            case 76:
                b.moveRight();
                break;
        }
    }
}
