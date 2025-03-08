//convert the object to a string yyymmdd
String convertDateTimeToString(DateTime dateTime) {
  String year = dateTime.year.toString();
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month'; //02 if february
  }
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day'; //03 if its the 3rd day
  }

  //combine the three
  String yyymmdd = year + month + day;

  return yyymmdd;
}