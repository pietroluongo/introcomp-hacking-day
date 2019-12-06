import processing.serial.*;

public class Pong {
    int leftScore;
    int rightScore;
    Player p1;
    Player p2;
    Ball b;

    boolean useAnalogControl;
    Serial analogModePort;

    private PongMainMenu mainmenu;

    public String gamestate;

    public Pong() {
        leftScore = 0;
        rightScore = 0;
        p1 = new Player(0);
        p2 = new Player(1);
        b = new Ball(p1, p2);
        mainmenu = new PongMainMenu();
        gamestate = "MAINMENU";
        useAnalogControl = false;
    }

    public void enableAnalogControl(String serialName) {
        useAnalogControl = true;
        analogModePort = new Serial(null, serialName, 9600);
        analogModePort.bufferUntil('\n');
    }

    public void enableAnalogControl(Serial s) {
        useAnalogControl = true;
        analogModePort = s;
        analogModePort.bufferUntil('\n');
    }

    public String getGameState() {
        return gamestate;
    }

    public void update() {
        if(gamestate == "MAINMENU") {
            mainmenu.draw();
        }
        else if (gamestate == "PAUSED" || gamestate == "PREGAME" || gamestate == "INGAME") {
            background(253, 102, 0);
            fill(255);
            p1.draw();
            p2.draw();
            b.tick();
            drawScore();
            //drawMiddle();
            b.draw();
            drawBoundaries();
        } 
    }

    public void drawMiddle() {
        for(int i = 0; i < 10; i++) {
            rect(width/2 - 5, (0.03*height + 75) + (i * 50), 10, 35);
        }
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
        if(gamestate == "INGAME" || gamestate == "PREGAME" || gamestate == "PAUSED") {
            if(useAnalogControl)
                ingameBindings_analog();
            else
                ingameBindings(key);
        }
        if(gamestate == "MAINMENU")
            mainMenuBindings(key);
    }

    public void mainMenuBindings(int key) {
        switch(key) {
            case 39:
                print("right");
                mainmenu.move_right();
                break;
            case 37:
                print("left");
                mainmenu.move_left();
                break;
            case 10:
                mainmenu.select();
                break;
            default:
                print("EO");
        }
    }

    void serialHandler(Serial port) {
        String s = port.readStringUntil('\n');
        if(s != null) {
            s = s.trim();
            int[] pos = int(split(s, '-'));
            p1.gogo_analog(pos[0]);
            p2.gogo_analog(pos[1]);
        }
        return;
    }


    public void ingameBindings_analog() {
        switch(key) {
            case 32:
                if(gamestate == "PREGAME")
                    gamestate = "INGAME";
                break;
            case 80:
                if(gamestate == "PAUSED") {
                    gamestate = "INGAME";
                    break;
                }
                gamestate = "PAUSED";
                break;
        }
    }

    public void ingameBindings(int key) {
        switch(key) {
            // Sistema de pausa
            case 32:
                if(gamestate == "PREGAME")
                    gamestate = "INGAME";
                break;
            case 80:
                if(gamestate == "PAUSED") {
                    gamestate = "INGAME";
                    break;
                }
                gamestate = "PAUSED";
                break;
            // Sistema de movimentação
            case 38:
            // up
                p2.moveUp();
                break;
            case 40:
            // down
                p2.moveDown();
                break;
            case 87:
                p1.moveUp();
                break;
            case 83:
                p1.moveDown();
                break;
            // DEBUG PONTUAÇÃO - Desativado
            case 37:
                //ponto do esquerdo
                //p1.addPoint();
                break;
            case 39:
                //p2.addPoint();
                break;
            // DEBUG BOLA - Desativado
            case 73:
                //b.moveUp();
                break;
            case 74:
                //b.moveLeft();
                break;
            case 75:
                //b.moveDown();
                break;
            case 76:
                //b.moveRight();
                break;
        }
    }

    public void notify(String s) {
        switch(s) {
            case "P1_SCORED":
                p1.addPoint();
                gamestate = "PREGAME";
                break;
            case "P2_SCORED":
                p2.addPoint();
                gamestate = "PREGAME";
                break;
            case "START_GAME":
                gamestate = "PREGAME";
                break;
        }
    }

}
