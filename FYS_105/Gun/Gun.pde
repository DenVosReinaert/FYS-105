class Gun extends GameObject {


<<<<<<< HEAD:Gun.pde
  Gun() {
    
  }
  
  void shoot() {
    if (cooldown == threshold) {
      bengine.engine.add(new Bullet());
      cooldown = 0;
    }
  }
  
  void recharge(){
=======
  void recharge() {
>>>>>>> Development:FYS_105/Gun.pde
    if (cooldown < threshold) {
      cooldown ++;
    }
  }
}
