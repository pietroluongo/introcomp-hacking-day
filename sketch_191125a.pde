Pong game;

void setup() {
    size(640, 480);
    background(253, 102, 0);
    stroke(255);
    game = new Pong();
}

void draw() {
    background(0,0,0);
    background(253, 102, 0);
    game.update();
}

void keyPressed() {
    game.readKey(keyCode);
}
