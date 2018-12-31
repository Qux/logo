import processing.pdf.*;

float mod = 0.01;
float b = 4.0;//8.0
float phase;
Float power = 4.0;
boolean dosave=false;

float tri(int angle) {
  angle = angle % 360;  //rescale input into 0 ~ 360

  int quadrant = angle / 90;
  float val = 0.0;

  switch(quadrant) {
  case 0:
    val = angle / 90.0;
    break;
  case 1:
    val = 1.0 - (angle - 90) / 90.0;
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
  strokeWeight(2.0);
  noFill();

  phase = 0.0;

  for (int i = 0; i < width; i++) {

    float phase2 = phase + pow(sin(PI * float(i+1) / width), 10) * b + 1;
    print(phase + ":");
    float dx = pow(sin(PI * float(i) / width), 10) * b + 1;
    phase += dx;
  }
}

void draw() {
  background(255);

  phase = 0.0;
  
  if (dosave) {
    beginRecord(PDF, "out.pdf");
  }
  beginShape();
  for (int i = 0; i < width; i++) {

    //if ( i < 360) {
    //  line(i, tri(i)*200.0+ 400, i+1, tri(i+1) * 200.0+ 400);
    //} else {
    //  float phase2 = phase + pow(sin(HALF_PI * float(i+1) / width), 10) * b + 1;
    //  line(i, tri(int(phase) )*200.0 + 400, i+1, tri(int(phase2)) * 200.0 + 400);

    //  float dx = pow(sin(HALF_PI * float(i) / width), 10) * b + 1;
    //  phase += dx;
    //}

    float phase2 = phase + pow(sin(PI * float(i+1) / width), power) * b + 1;
    //line(i, tri(int(phase) )*200.0 + 400, i+1, tri(int(phase2)) * 200.0 + 400);
    vertex(i, tri(int(phase)) * 200.0 + 400);
    float dx = pow(sin(PI * float(i) / width), power) * b + 1;
    phase += dx;
  }
  endShape();
  
  if (dosave) {
    endRecord();
    exit();
  }
}


void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case UP:
      b += 0.1;
      println(b);
      break;
    case DOWN:
      if (0.0 < mod) {
        b -= 0.1;
      }
      println(b);
      break;
    default:
      break;
    }
  } else {
    switch(key) {
    case 's':
      dosave=true;
      break;
    }
  }
}
