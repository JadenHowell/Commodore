class Utils {
  static cashToString(int cash){
    String cashString;
    if(cash > 1000000){
      cashString = (cash / 1000000).toString() + "M";
    } else {
      cashString = (cash ~/ 1000).toString() + "K"; //toInt() allows us to remove decimal places if we still not over 1 mil
    }
    return cashString;
  }
}