int reds = 1 + (int)(Math.random()*100);
int greens = 1 + (int)(Math.random()*100);
int blues = 1 + (int)(Math.random()*100);
int max = reds + greens + blues;
Red[] r = new Red[max];
Green[] g = new Green[max];
Blue[] b = new Blue[max];


void setup(){
  size(500,500);
  noStroke();
  for (int i = 0; i < reds; i++){
    r[i] = new Red((int)(Math.random()*501),(int)(Math.random()*501),i);
  }
  
  for (int i = 0; i < greens; i++){
    g[i] = new Green((int)(Math.random()*501),(int)(Math.random()*501),i);
  }
  
  for (int i = 0; i < blues; i++){
    b[i] = new Blue((int)(Math.random()*501),(int)(Math.random()*501),i);
  }
}

void draw(){
  background(100);
  for (int i = 0; i < reds; i++){
    r[i].move();
    r[i].show();
  }
  
  for (int i = 0; i < greens; i++){
    g[i].move();
    g[i].show();
  }
  
  for (int i = 0; i < blues; i++){
    b[i].move();
    b[i].show();
  }
  
  textAlign(CENTER);
  textSize(80);
  if (reds == 0 && greens == 0){text("Blue wins!",250,450);}
  if (greens == 0 && blues == 0){text("Red wins!",250,450);}
  if (blues == 0 && reds == 0){text("Green wins!",250,450);}
}

class Red{
  float x,y;
  int index;
  int gi = 0;
  float gclose = 708;
  int bi = 0;
  float bclose = 708;
  
  Red(float newX,float newY, int i){
    x = newX;
    y = newY;
    index = i;
  }
  
  void move(){
    float ag = 0;
    gi = 0;
    gclose = 708;
    for (int i = 0; i < greens; i++){
      if (dist(x,y,g[i].x,g[i].y) <= gclose){
        gi = i;
        gclose = dist(x,y,g[i].x,g[i].y);
      }
      ag = atan2(g[gi].y - y, g[gi].x - x);
    }
    
    float ab = 0;
    bi = 0;
    bclose = 708;
    for (int i = 0; i < blues; i++){
      if (dist(x,y,b[i].x,b[i].y) <= bclose){
        bi = i;
        bclose = dist(x,y,b[i].x,b[i].y);
      }
      ab = atan2(b[bi].y - y, b[bi].x - x);
    }

    x += -2.5 + (Math.random()*5) - cos(ab)/((bclose+1)/25);
    if (greens != 0){x+=cos(ag);}
    y += -2.5 + (Math.random()*5) - sin(ab)/((bclose+1)/25);
    if (greens != 0){y+=sin(ag);}
    
    if (x < 5) x = 5;
    if (x > 495) x = 495;
    if (y < 5) y = 5;
    if (y > 495) y = 495;
  }
  
  void show(){
    fill(255,0,0);
    ellipse(x,y,10,10);
    if (blues != 0){
      if ((dist(x,y,b[bi].x,b[bi].y)) < 10){
      changeR(index);
      }
    }
  }
  
  
}// red class

class Green{
  float x,y;
  int index;
  int bi = 0;
  float bclose = 708;
  int ri = 0;
  float rclose = 708;
  
  Green(float newX,float newY, int i){
    x = newX;
    y = newY;
    index = i;
  }
  
  void move(){
    float ab = 0;
    bi = 0;
    bclose = 708;
    for (int i = 0; i < blues; i++){
      if (dist(x,y,b[i].x,b[i].y) <= bclose){
        bi = i;
        bclose = dist(x,y,b[i].x,b[i].y);
      }
      ab = atan2(b[bi].y - y, b[bi].x - x);
    }
    
    float ar = 0;
    ri = 0;
    rclose = 708;
    for (int i = 0; i < reds; i++){
      if (dist(x,y,r[i].x,r[i].y) <= rclose){
        ri = i;
        rclose = dist(x,y,r[i].x,r[i].y);
      }
      ar = atan2(r[ri].y - y, r[ri].x - x);
    }
    
    x += -2.5 + (Math.random()*5) - cos(ar)/((rclose+1)/25);
    if (blues != 0){x+=cos(ab);}
    y += -2.5 + (Math.random()*5) - sin(ar)/((rclose+1)/25);
    if (blues != 0){y+=sin(ab);}
    
    if (x < 5) x = 5;
    if (x > 495) x = 495;
    if (y < 5) y = 5;
    if (y > 495) y = 495;
  }
  
  void show(){
    fill(0,255,0);
    ellipse(x,y,10,10);
    if (reds != 0){
      if ((dist(x,y,r[ri].x,r[ri].y)) < 10){
      changeG(index);
      }
    }
  }
}// green class

class Blue{
  float x,y;
  int index;
  int ri = 0;
  float rclose = 708;
  int gi = 0;
  float gclose = 708;
  
  Blue(float newX,float newY, int i){
    x = newX;
    y = newY;
    index = i;
  }
  
  void move(){
    float ar = 0;
    ri = 0;
    rclose = 708;
    for (int i = 0; i < reds; i++){
      if (dist(x,y,r[i].x,r[i].y) <= rclose){
        ri = i;
        rclose = dist(x,y,r[i].x,r[i].y);
      }
      ar = atan2(r[ri].y - y, r[ri].x - x);
    }
    
    float ag = 0;
    gi = 0;
    gclose = 708;
    for (int i = 0; i < greens; i++){
      if (dist(x,y,g[i].x,g[i].y) <= gclose){
        gi = i;
        gclose = dist(x,y,g[i].x,g[i].y);
      }
      ag = atan2(g[gi].y - y, g[gi].x - x);
    }
    
    x += -2.5 + (Math.random()*5) - cos(ag)/((gclose+1)/25);
    if (reds != 0){x += cos(ar);}
    y += -2.5 + (Math.random()*5) - sin(ag)/((gclose+1)/25);
    if (reds != 0){y += sin(ar);}
    
    if (x < 5) x = 5;
    if (x > 495) x = 495;
    if (y < 5) y = 5;
    if (y > 495) y = 495;
  }
  
  void show(){
    fill(0,0,255);
    ellipse(x,y,10,10);
    if (greens != 0){
      if ((dist(x,y,g[gi].x,g[gi].y)) < 10){
      changeB(index);
      }
    }
  }
}// blue class

void changeR(int ind){
  b[blues] = new Blue(r[ind].x,r[ind].y,blues);
  blues++;
  r[ind] = null;
  for (int i = ind; i < reds; i++){
    r[i] = r[i + 1];
    if (r[i] != null){
    r[i].index = i;
    }
  }
  reds--;
}

void changeG(int ind){
  r[reds] = new Red(g[ind].x,g[ind].y,reds);
  reds++;
  g[ind] = null;
  for (int i = ind; i < greens; i++){
    g[i] = g[i + 1];
    if (g[i] != null){
    g[i].index = i;
    }
  }
  greens--;
}

void changeB(int ind){
  g[greens] = new Green(b[ind].x,b[ind].y,greens);
  greens++;
  b[ind] = null;
  for (int i = ind; i < blues; i++){
    b[i] = b[i + 1];
    if (b[i] != null){
    b[i].index = i;
    }
  }
  blues--;
}
