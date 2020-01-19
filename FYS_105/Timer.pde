class Timer
{

  float startMillis, milliSeconds;




  Timer(float secondsInit)
  {
    milliSeconds = secondsInit * 1000;
    startMillis = millis();
  }



  boolean TimerDone()
  {
    if (millis() - milliSeconds > startMillis)
    {
      return true;
    } else return false;
  }



  void Reset()
  {
    startMillis = millis();
  }
}
