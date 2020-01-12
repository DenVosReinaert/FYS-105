class EnemyProjectile extends GameObject
{

  Timer homingTimer = new Timer(4);

  String projectileType;




  EnemyProjectile(float objPosXInput, float objPosYInput, String type)
  {
    projectileType = type;

    objPosX = objPosXInput;
    objPosY = objPosYInput;

    objWidth = bulletTurret.width;
    objHeight = bulletTurret.height;

    moveVelX = 1;
    moveVelY = 1;

    dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
    dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

    dir = sqrt(sq(dx) + sq(dy));

    dx *= (moveVelX / dir);
    dy *= (moveVelY / dir);
  }




  void draw()
  {
    pushStyle();
    image(bulletTurret, objPosX, objPosY);
    popStyle();
    if (projectileType == "homing")
    {
      if (!homingTimer.TimerDone())
      {
        //PROJECTILE MOVEMENT
        dx = (myPlayer.objPosX + myPlayer.objWidth/2) - (objPosX + objWidth/2);
        dy = (myPlayer.objPosY + myPlayer.objHeight/2) - (objPosY + objHeight/2);

        dir = sqrt(sq(dx) + sq(dy));

        dx *= (moveVelX / dir);
        dy *= (moveVelY / dir);
      } else
        Remove(this);
    }
    if (!collLeft && !collRight)
      objPosX += dx;
    else
      Remove(this);

    if (!collTop && !collBott)
      objPosY += dy;
    else
      Remove(this);

    //Collision with Player if they are able to be hit
    if (UI.ableToBeHit && objPosX < myPlayer.objPosX + myPlayer.objWidth && objPosX + objWidth > myPlayer.objPosX && objPosY < myPlayer.objPosY + myPlayer.objHeight && objPosY + objHeight > myPlayer.objPosY)
    {
      if (UI.levens >0 && UI.shield <= 0) {
        UI.hitValue = 1;
        //  UI.levens-= hitValue;
        Remove(this);
      }
      UI.spelerhit();
      if (UI.shield > 0) {
        UI.shield -= 1;
      }
    }
  }
}
