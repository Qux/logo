import processing.pdf.*;

float mod = 0.01;

float tri(int angle) {
  angle = angle % 360;  //rescale input into 0 ~ 360

  int quadrant = angle / 90;
  float val = 0.0;

  switch(quadrant) {
  case 0:
    val = angle / 90.0;
    break;
  case 1:
    val = 1.0 - float(angle - 90) / 90.0;
    break;
  case 2:
    val = 1.0 - (angle - 90.0) / 90.0;
    break;
  case 3:
    val = -1.0 + (angle - 270.0) / 90.0;
    break;
  }

  return val;
}

void setup() {
  size(1200, 800);
  background(255);
  stroke(0);
  strokeWeight(1.0);
}




void draw() {
  background(255);
  pushMatrix();
  translate(0, height*0.5);

  for (int i = 0; i < width; i++) {
    //float angle = sin(TWO_PI * i / width;
    //int p1 = int(sin( i  / width * PI) * 360.0) + 360;
    //int p2 = int(sin(i+1 / width * PI) * 360.0) + 360;
    
    line(i, tri(i)*200, i+1, tri(i+1) * 200);
  }

  popMatrix();
}


void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      mod *= 2.0;
      break;
    case DOWN:
      if (0.0 < mod) {
        mod *= 0.5;
      }
      break;
    default:
      break;
    }
  }
}
