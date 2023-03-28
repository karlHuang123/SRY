////jadebenton

ArrayList<Particle> pts;
boolean onPressed, showInstruction = true;
PFont f;
PImage K;
PImage L;
PImage M;
PImage S;
PImage smile;
PImage heart;
void setup() {
  fullScreen();
  smooth();
  colorMode(RGB);
  rectMode(CENTER);

  pts = new ArrayList<Particle>();

  f = createFont("Calibri", 24, true);

  background(0);
  K = loadImage("K.jpeg");
  L = loadImage("L.jpeg");
  M = loadImage("M.jpeg");
  S = loadImage("S.jpeg");
  smile = loadImage("smile.png");
  heart = loadImage("heart.png");
  K.resize(50, 50);
  L.resize(50, 50);
  M.resize(50, 50);
  S.resize(50, 50);
  smile.resize(50, 50);
  heart.resize(50, 50);
}

void draw() {
  //if (showInstruction) drawInstruction();
  if (onPressed) {
    for (int i=0;i<10;i++) {
      float a = random(6);
      if (a < 1) {
        Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size(), K);
        pts.add(newP);       
      } else if (a < 2) {
        Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size(), L);
        pts.add(newP);
      }else if (a < 3) {
        Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size(), M);
        pts.add(newP);
      }else if (a < 4) {
        Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size(), M);
        pts.add(newP);
      }else if (a < 5) {
        Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size(), smile);
        pts.add(newP);
      }else {
        Particle newP = new Particle(mouseX, mouseY, i+pts.size(), i+pts.size(), heart);
        pts.add(newP);
      }
    }
  }

  for (int i=pts.size()-1; i>-1; i--) {
    Particle p = pts.get(i);
    if (p.dead) {
      pts.remove(i);
    }else{
      p.update();
       p.display();
    }
  }
}

void drawInstruction(){
  background(255);
  fill(128);
  textAlign(CENTER, CENTER);
  textFont(f);
  textLeading(36);
  text("Drag and draw." + "\n" +
       "Press 'c' to clear the stage." + "\n"
       ,width*0.5, height*0.5);
}
