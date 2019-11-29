abstract class Gun {

  float cooldown, threshold;

  Gun() {
    
  }
  
  void shoot() {
    if (cooldown == threshold) {
      bengine.engine.add(new Bullet());
      cooldown = 0;
    }
  }
  
  void recharge(){
    if (cooldown < threshold) {
      cooldown = cooldown + 1;
    }
  }
  
}
