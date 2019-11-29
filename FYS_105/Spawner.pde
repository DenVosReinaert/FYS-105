//Ruben de Jager
class Spawner{
  
  float spawnerPosX,spawnerPosY,spawnerW,spawnerH;
  
  Spawner(){
    spawnerPosX=width/2-spawnerW;
    spawnerPosY=-225;
    spawnerW=100;
    spawnerH=100;
  }//constructor spawner
  
  void spawnerShow(){
    fill(255);
    rect(spawnerPosX,spawnerPosY,spawnerW,spawnerH);
  }//spawnerShow
  
  void spawnerUpdate(){
   if (frameCount<100){
     
   }else if(frameCount<400){
     straightLine1();
   }else if(frameCount<1500){
     straightLine1();
     straightLine2();
   }else if (frameCount<2300){
     straightLine1();
     straightLine2();
     straightLine3();
   }

   
  }//spawnerUpdate
  void straightLine1(){
    if(frameCount %100==0){//modulus
    AI.add(new Grunt());
    }
  }
  
  void straightLine2(){
    if(frameCount %50==0){//modulus
    AI.add(new Speedster());
    }
  }
  
  void straightLine3(){
    if(frameCount %30==0){//modulus
    AI.add(new Heavy());
    }
  }
  
}//class Spawner
