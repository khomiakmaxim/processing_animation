float xA = 200;
float yA = 300;
float xB = 150;
float yB = 350;
float xC = 250;
float yC = 350;

boolean bySin = true;
boolean to = true;
void setup()
{
  size(600, 600);
  smooth();
  frameRate(15);    
}

float[] coordAndRadiusOfInscribed(float XA, float YA)
{  
  float BA = sqrt(sq(XA - xB) + sq(YA - yB));
  float AC = sqrt(sq(xC - XA) + sq(yC - YA));
  float BC = sqrt(sq(xC - yB) + sq(yC - yB));
  
  float P = BA + BC + AC;
  
  float Ox = (XA * BC + xB * AC + xC * BA)/P;
  float Oy = (YA * BC + yB * AC + yC * BA)/P;  
  float p = P/2;
  
  float radius = sqrt(((p - BA)*(p - BC)*(p - AC))/p);
  float[] result = {Ox, Oy, radius};
  return result;
}

float coordAndRadiusOfCircumScribed(float XA, float YA)
{
  float BA = sqrt(sq(XA - xB) + sq(YA - yB));
  float AC = sqrt(sq(xC - XA) + sq(yC - YA));
  float BC = sqrt(sq(xC - yB) + sq(yC - yB));
  
   float s = (BA + AC + BC) / 2;
   float area = sqrt(s * (s - BA) * (s - BC) * (s - AC));
   
   float radius = (BA * BC * AC) / 4 / area;
   
   return radius;
}

void mouseClicked() {
  if (bySin) {
    bySin = false;
  } else {
    bySin = true;
  }
}

void draw()
{
  
  background(144);
  //fill(0, 255, 0);
  //rect(30, 20, 55, 55, 45);
  
  fill(255, .9);
  triangle(xA, yA, xB, yB, xC, yC);
  float[] result = coordAndRadiusOfInscribed(xA, yA);
  fill(255, .9);
  circle(result[0], result[1], result[2] * 2);
  //println(result[2]);
  if(to)
    xA += 1;
  else  
    xA -= 1;    
  if(xA > 250)  
    to = false;    
  if(xA < 150)  
    to = true;  
  if(bySin)
  {
    yA = sin(xA) * 60 + 100;  
  }  
}
