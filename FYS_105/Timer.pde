class Timer
{

  float frames, framesInitial;

  Timer(int seconds)
  {
    framesInitial = seconds * frameRate;
    frames = framesInitial;
  }

  public float Timerr()
  {
    frames --;

    return frames;
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
