import java.util.Vector;

// Classe específica para esse projeto, criada EXCLUSIVAMENTE para organização do código

public class PongMainMenu {
	int selected;
	final int menuSize = 3;
	public PongMainMenu() {
		selected = 0;
	}

	public void draw() {
		background(0, 101, 255);
		textAlign(CENTER);
        text("INTROCOMP\nHACKING\nDAY", width/2, height * 0.25);
        switch(selected) {
        	case 0:
        		rect(width * 0.2, height * 0.75, 64, 100);
        		break;
        	case 1:
        		rect(width/2, height * 0.75, 20, 20);
        		break;
        	case 2:
        		rect(width * 0.8, height * 0.75, 20, 20);
        		break;
        	default:
        		print("O SELECTED TA ERRADO AE MEU\n");
        		print("O SELECT TA VALENDO " + selected + "\n");
        }
        text("INICIAR", width * 0.2, height * 0.75);
        text("OPÇÕES", width/2, height * 0.75);
        text("SAIR", width * 0.8, height * 0.75);
	}

	public void move_left() {
		if(selected - 1 < 0) {
			selected = menuSize-1;
		}
		else
			selected--;
	}

	public void move_right() {
		if(selected + 1 > menuSize - 1) {
			selected = 0;
		}
		else
			selected++;
	}
	
	public void select() {
		switch(selected) {
        	case 0:
        		game.notify("START_GAME");
        		break;
        	case 1:
        		rect(width/2, height * 0.75, 20, 20);
        		break;
        	case 2:
        		exit();
        		break;
        	default:
        		print("O SELECTED TA ERRADO AE MEU\n");
        		print("O SELECT TA VALENDO " + selected + "\n");
        }
	}

}