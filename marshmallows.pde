float gravity = 9.8 * 10;
ArrayList<Marshmallow> marshmallows = new ArrayList<Marshmallow>();

void setup(){
  size(400, 400);
}

int lastMillis;
int lastUpdate;
void draw(){
  background(30);
  fill(220);
  noStroke();
  rect(0, height / 4, width, height);
  fill(97, 62, 58, 255);
  noStroke();
  rect(0, height / 2, width, height);
  for(Marshmallow marshmallow : marshmallows){
    marshmallow.update((millis() - lastMillis) / 1000.0);
    marshmallow.draw();
  }
  
  if(millis() - lastUpdate > 100){
    lastUpdate += 100;
    for(Marshmallow marshmallow : marshmallows){
      marshmallow.velocity.div(1.1);
    }
  }
  
  fill(97, 62, 58, 100);
  noStroke();
  rect(0, height / 2, width, height);

  
  lastMillis = millis();
}

void mousePressed(){
  marshmallows.add(new Marshmallow(new PVector(mouseX, mouseY)));
}
