abstract class Gun {


  float cooldown, threshold;

  Gun() {
    
  }
  
  void shoot() {
        bullet.timer--;
    if (keyPressed && keyCode  == UP && cooldown <= 0) {
      player.bulletList.add(new Bullet(new PVector (player.xPosition + player.playerSize/2, player.yPosition + player.playerSize/2)));
      cooldown = 20;
    }
    if (keyPressed && keyCode  == DOWN && cooldown <= 0) {
      player.bulletList.add(new Bullet(new PVector (player.xPosition + player.playerSize/2, player.yPosition + player.playerSize/2)));
      cooldown = 20;
    }
    if (keyPressed && keyCode  == LEFT && cooldown <= 0) {
      player.bulletList.add(new Bullet(new PVector (player.xPosition + player.playerSize/2, player.yPosition + player.playerSize/2)));
      cooldown = 20;
    }
    if (keyPressed && keyCode  == RIGHT && cooldown <= 0) {
      player.bulletList.add(new Bullet(new PVector (player.xPosition + player.playerSize/2, player.yPosition + player.playerSize/2)));
      cooldown = 20;
    }
    //draws every bullet independendly
    for (Bullet bullets : player.bulletList) {
      bullets.draw();
    }
  }
  
  void recharge(){
    if (cooldown < threshold) {
      cooldown = cooldown + 1;
    }
  }
}
