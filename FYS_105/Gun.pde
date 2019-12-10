class Gun extends GameObject {



  void recharge() {
  Gun() {
    
  }
  
  void shoot() {
    if (cooldown == threshold) {
      bengine.engine.add(new Bullet(myPlayer.playerPosX, myPlayer.playerPosY));
      cooldown = 0;
    }
  }
}
