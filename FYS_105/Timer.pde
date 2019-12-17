class Timer
{

  int frames, currentCount;

  boolean Timerr(int seconds)
  {
    frames = seconds * 60;

    currentCount ++;

    if (currentCount == frames)
    {
      seconds = 0;
      currentCount = 1;
      return true;
    } else return false;
  }
}
