class Timer
{

  int frames, currentCount;

  boolean Timerr(int seconds)
  {
    frames = seconds * 60;

    currentCount ++;

    if (currentCount >= frames)
    {
      return true;
    }
    return false;
  }
  
  
  boolean LoopingTimerr(int seconds)
  {
   frames = seconds * 60;
   
   currentCount ++;
   
   if(currentCount >= frames)
   {
    currentCount = 0;
    return true;
   }
   return false;
  }
}
