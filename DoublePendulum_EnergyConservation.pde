float l1;
float l2;
float m1;
float m2;
float x1;
float y1;
float x2;
float y2;
float v1;
float v2;
float a1;
float a2;
float w1;
float w2;
float g;
float p1;
float p2;
PGraphics canvas;


void setup(){
  fullScreen();
  //size(1000,500);
  background(200,200,200);
  m1 = 70;
  m2 = 50;
  l1 = 200;
  l2 = 450;
  
  v1 = 0;
  v2 = 0;
  a1 = 0;
  a2 = 0;
  w1 = PI/random(10)+random(3);
  w2 = PI/random(10)+random(3);
  
  g = 1;
  
  canvas = createGraphics(width,height);
}



void draw(){
  translate(width/2,height/4);
  background(200,100,100);
  //background(200,255,200);
  //background(160,170,255);
  fill(0);
  stroke(0);
  strokeWeight(2);
  
  //delay(50);
  
  a1=(-g*(2*m1+m2)*sin(w1)-m2*g*sin(w1-2*w2)-2*sin(w1-w2)*m2*(v2*v2*l2+v1*v1*l1*cos(w1-w2)))/(l1*(2*m1+m2-m2*cos(2*w1-2*w2)));
  a2=(2*sin(w1-w2)*(v1*v1*l1*(m1+m2)+g*(m1+m2)*cos(w1)+v2*v2*l2*m2*cos(w1-w2)))/(l2*(2*m1+m2-m2*cos(2*w1-2*w2)));
  
  v1+=a1;
  v2+=a2;
  
  w1+=v1;
  w2+=v2;
  
  p1=x2;
  p2=y2;
  
  x1=l1*sin(w1);
  y1=l1*cos(w1);
  x2=l2*sin(w2)+x1;
  y2=l2*cos(w2)+y1;
  
  v1*=1.01;
  v2*=0.99;//0.999;
  
  line(0,0,x1,y1);
  line(x1,y1,x2,y2);
  ellipse(x1,y1,m1,m1);
  ellipse(x2,y2,m2,m2);
  
  if(frameCount>1){
    canvas.beginDraw();
    canvas.line(x2+width/2,y2+height/4,p1+width/2,p2+height/4);
    canvas.endDraw();
    imageMode(CORNER);
    image(canvas, -width/2 , -height/4 , width, height);
  }
  saveFrame("Energy_v1_1.01_v2_0.99/frame######.png");
  if(frameCount == 2400){exit();}
}
  
  
  
  
  
