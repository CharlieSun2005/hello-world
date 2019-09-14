class Timer {
  int startTime, totalTime;
  
  Timer() {
    startTime = millis(); 
    totalTime = 30000;
  }
  
  Timer(int tt) {
    startTime = millis(); 
    totalTime = tt * 1000;
  }
  
  boolean timeHasRunOut() {
    if (millis() > totalTime + startTime) {
      return true;
    } 
    return false;
  }
  
  int timeRemainingMillis() {
    if (timeHasRunOut()) {
      return 0; 
    }
    return (totalTime+startTime)-millis();
  }
  
  int timeRemainingSeconds() {
    if (timeHasRunOut()) {
      return 0; 
    }
    return ceil(((totalTime+startTime)-millis())/1000.0);
  }
  
  void resetTimer() {
    startTime = millis();
  }
}
