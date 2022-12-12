float drawRadius = 10;

class Marshmallow {
  
  PVector position, velocity = new PVector();
  float rotation, floatStrength;
  PVector[] corners;
  float size = 10;
  
  Marshmallow(PVector position){
    this.position = position;
    rotation = random(HALF_PI);
  }
  
  void update(float deltaTime){
    velocity.y += gravity * deltaTime;
    if(position.y >= height / 2){
      velocity.y -= gravity * deltaTime * 1.5;
    }
    position.add(velocity.copy().mult(deltaTime));
    collisions();
  }
  
  PVector[] corners(){
    PVector[] output = new PVector[4];
    
    for(int i = 0; i < 4; i++){
      output[i] = PVector.fromAngle(TWO_PI / 4 * i + rotation).mult(size).add(position);
    }
    
    return output;
  }
  
  void collisions(){
    for(Marshmallow marshmallow : marshmallows){
      if(marshmallow == this)
        continue;
      PVector between = position.copy().sub(marshmallow.position);
      float distance = between.mag();
      if(distance >= drawRadius * 2)
        continue;
        
      position.add(between.copy().div(distance / (drawRadius / 16)));
      marshmallow.position.sub(between.copy().div(distance / (drawRadius / 16)));
    }
  }
  
  void draw(){
    fill(255);
    circle(position.x, position.y, drawRadius * 2);
  }
}
