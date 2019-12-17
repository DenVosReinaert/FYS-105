class Timer
{

  int frames, framesInitial;

  public Timer(int seconds)
  {
    framesInitial = seconds * (int) frameRate;
    
    frames = framesInitial;
    
    frames --;
  }


  boolean TimerDone()
  {
    if (frames < 0)
    {
      TimerReset();
      return true;
    }
    return false;
  }

  boolean TimerDoneWithoutReset()
  {
    if (frames < 0)
    {
      return true;
    }
    return false;
  }

  public void TimerReset()
  {
    frames = framesInitial;
  }
}
