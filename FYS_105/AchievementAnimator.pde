class AchievementAnimator extends GameObject
{
  Timer achievementRetractTimer = new Timer(20);

  int achievementNumber;



  AchievementAnimator(int achievementNumberInput)
  {
    println("ACHIEVEMENT ANIMATION NUMBER: " + achievementNumber + " HAS BEEN CREATED!");
    chieves.achievementAnimsActive++;

    achievementNumber = achievementNumberInput;

    objPosX = chieves.startPosX;
    objPosY = chieves.startPosY;
    achievementRetractTimer.Reset();
  }



  void draw()
  {
    switch(achievementNumber)
    {
    case 1:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (dist(objPosX, objPosY, chieves.endPosX, chieves.endPosY) >= 0 && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 3;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 3;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 2:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (dist(objPosX, objPosY, chieves.endPosX, chieves.endPosY) >= 0 && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 3;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 3;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 3:
      println(objPosX + " " + objPosY);
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (dist(objPosX, objPosY, chieves.endPosX, chieves.endPosY) >= 0 && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 3;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 3;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 4:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (dist(objPosX, objPosY, chieves.endPosX, chieves.endPosY) >= 0 && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 3;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 3;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 5:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (dist(objPosX, objPosY, chieves.endPosX, chieves.endPosY) >= 0 && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 3;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 3;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 6:
      image(chievePlate[achievementNumber], objPosX, objPosY);

      if (dist(objPosX, objPosY, chieves.endPosX, chieves.endPosY) >= 0 && !achievementRetractTimer.TimerDone()) 
      {
        objPosX -= 3;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX += 3;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    }
  }
}
