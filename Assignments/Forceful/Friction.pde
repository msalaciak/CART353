//this is the friciton class. It is inspired and uses code from the liquid example from class and Daniel Shiffman's tutorials

class Friction {
//declaration of variables

  PImage ice;
  float x, y, w, h;
  
  float c;
//constructor
  Friction(float x, float y, float w, float h, float c, PImage ice) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.ice = ice;
  }

  //This is a boolean method that comes from the liqud example
  //it checks to see if the Mover object is in a position of friction, in my case an ice patch
  boolean contains(Mover m) {
    PVector ice = m.position;
    return ice.x > x && ice.x < x + w && ice.y > y && ice.y < y + h;
  }

  // this method calculates the friciton caused by the ice patch. Since ice reduces friction which is why we slip
  //the friciton coefficient is larger than 0.1 so when its multiplies the speed squared function it produces a bigger force.
  PVector ice(Mover m) {

    float speed = m.velocity.mag();
    float slipMagnitude = c *(speed * speed);

    
    PVector slipForce = m.velocity.copy();
    slipForce.mult(1);

    slipForce.normalize();
    slipForce.mult(slipMagnitude);
    return slipForce;
  }
  
 
//this displays the ice patches, i use a tint to reduce opacity so when objects are on it it looks like they are icy.
  void display() {
    
    tint(255, 126);
    imageMode(CORNER);
    image(ice,x, y, w, h);
  }
}