class AchievementAnimator extends GameObject
{
  Timer achievementRetractTimer = new Timer(20);

  int achievementNumber;



  AchievementAnimator(int achievementNumberInput, float objPosXInput, float objPosYInput)
  {

    chieves.achievementAnimsActive++;

    achievementNumber = achievementNumberInput;

    objPosX = objPosXInput;
    objPosY = objPosYInput;
    achievementRetractTimer.Reset();
  }



  void draw()
  {
    println(objPosX, objPosY);

    switch(achievementNumber)
    {
    case 1:
      image(chievePlate[achievementNumber-1], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX --;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX ++;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 2:
      image(chievePlate[achievementNumber-1], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX --;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX ++;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 3:
      image(chievePlate[achievementNumber-1], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX --;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX ++;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 4:
      image(chievePlate[achievementNumber-1], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX --;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX ++;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 5:
      image(chievePlate[achievementNumber-1], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX --;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX ++;
        }

        if (objPosX > width && achievementRetractTimer.TimerDone())
        {
          chieves.achievementAnimsActive--;
          chieves.achievementAnim.remove(this);
        }
      }
      break;
    case 6:
      image(chievePlate[achievementNumber-1], objPosX, objPosY);

      if (chieves.endPosX <= objPosX && !achievementRetractTimer.TimerDone()) 
      {
        objPosX --;
        achievementRetractTimer.Reset();
      } else 
      {
        if (achievementRetractTimer.TimerDone())
        {
          objPosX ++;
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
