class Timer
{

  int frames;

  boolean Timerr(int seconds)
  {
    frames = seconds * 60;

    for (int currentCount = 0; currentCount < frames; currentCount++)
    {

      if (currentCount == frames)
      {
        println("Your timer is done");

        seconds = 0;
        currentCount = 1;


        return true;
        
      } else return false;
    }
  }
}
