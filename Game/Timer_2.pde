class Timers {
  int startTime, totalTime;
  
  Timers() {
    startTime = millis(); 
    totalTime = 30000;
  }
  
  Timers(int tc) {
    startTime = millis(); 
    totalTime = tc * 1000;
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
