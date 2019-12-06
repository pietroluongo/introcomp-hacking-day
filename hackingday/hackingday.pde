Pong game;

Serial arduinoPort;

void setup() {
    size(800, 600);
    background(0);
    stroke(0);
    game = new Pong();
    arduinoPort = new Serial(this, "/dev/ttyACM0", 9600);
    game.enableAnalogControl(arduinoPort);
    PFont scoreFont = loadFont("Dialog.bold-64.vlw");
    textFont(scoreFont, 32);
}

void draw() {
    background(0);
    game.update();
}

void keyPressed() {
    game.readKey(keyCode);
    //System.out.println(keyCode);
}

// Passthrough
void serialEvent(Serial port) {
    game.serialHandler(port);
}