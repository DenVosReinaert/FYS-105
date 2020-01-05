class Timer
{

  float startMillis, secondsInit;
  



Timer(float seconds)
{
  secondsInit = seconds;
 startMillis = millis() * secondsInit; 
}


  
  boolean TimerDone()
  {
   if(millis() > startMillis)
   {
   return true;  
   }
   else return false;
  }

  
  
  void Reset()
  {
   startMillis = millis() * secondsInit; 
    
  }
  
}
