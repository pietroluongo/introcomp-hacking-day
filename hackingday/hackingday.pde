Pong game;

void setup() {
    size(800, 600);
    background(253, 102, 0);
    stroke(0);
    game = new Pong();
    PFont scoreFont = loadFont("Dialog.bold-64.vlw");
    textFont(scoreFont, 32);
}

void draw() {
    background(0,0,0);
    background(253, 102, 0);
    game.update();
}

void keyPressed() {
    game.readKey(keyCode);
    System.out.println(keyCode);
}
