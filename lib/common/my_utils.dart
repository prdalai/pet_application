class MyUtils {
  String getDayGreeting() {
    var currentHour = DateTime.now().hour;
    if (currentHour < 12) {
      return 'Good Morning!';
    }
    if (currentHour < 17) {
      return 'Good Afternoon!';
    }
    return 'Good Evening!';
  }

}