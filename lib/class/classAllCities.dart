import 'package:http/http.dart';
import 'dart:convert';

class AllCities {
  final String link;

  AllCities({required this.link});

  String timeFajr = "";
  String timeDhuhr = "";
  String timeAsr = "";
  String timeMaghrib = "";
  String timeIsha = "";
  String timeSunrise = "";
  String date1M = "";
  String date2H = "";
  List remainderTim = [];
  List nameAzan = [
    "timeFajr",
    "timeSunrise",
    "timeDhuhr",
    "timeAsr",
    "timeMaghrib",
    "timeIsha"
  ];
  int indexMinTime = 0;
  getData() async {
    Response response = await get(Uri.parse(
        "https://api.aladhan.com/v1/timingsByCity?city=${link}&country=egypt&method=8"));
    var receivedData = jsonDecode(response.body);
     date1M = receivedData["data"]["date"]["readable"];
    date2H ="${receivedData["data"]["date"]["hijri"]["day"]}  ${receivedData["data"]["date"]["hijri"]["month"]["en"]},${receivedData["data"]["date"]["hijri"]["year"]} ";
    timeFajr = convert12(receivedData["data"]["timings"]["Fajr"]);
    timeSunrise = convert12(receivedData["data"]["timings"]["Sunrise"]);
    timeDhuhr = convert12(receivedData["data"]["timings"]["Dhuhr"]);
    timeAsr = convert12(receivedData["data"]["timings"]["Asr"]);
    timeMaghrib = convert12(receivedData["data"]["timings"]["Maghrib"]);
    timeIsha = convert12(receivedData["data"]["timings"]["Isha"]);
    int minTime = 25;

    for (var i = 0; i < remainderTim.length; i++) {
      if (minTime > remainderTim[i].hour) {
        minTime = remainderTim[i].hour;
        indexMinTime = i;
      }
    }

    // Do whatever you want
  }

  fun() async {
    await getData();
  }

  reminderTime(String str) {
    DateTime now = DateTime.now();
    //DateTime date1 = DateTime.parse(str);
    DateTime date1 = DateTime.parse("2042-08-18 $str");
    DateTime date2 =
        date1.subtract(Duration(hours: now.hour, minutes: now.minute));
    print("${date2.hour}  ${date2.minute}");
    remainderTim.add(date2);
  }

  convert12(String str) {
    reminderTime(str);
    String strNew = "";
    // Get Hours
    int h1 = int.parse(str[0]) - int.parse('0');
    int h2 = int.parse(str[1]) - int.parse('0');

    int hh = h1 * 10 + h2;

    // Finding out the Meridien of time
    // ie. AM or PM
    String Meridien;
    if (hh < 12) {
      Meridien = "am";
    } else
      Meridien = "pm";

    hh %= 12;

    // Handle 00 and 12 case separately
    if (hh == 0) {
      hh = int.parse('12');
      strNew += "12";

      // Printing minutes and seconds
      for (int i = 2; i < str.length; ++i) {
        strNew += str[i];
      }
    } else {
      strNew += "$hh".padLeft(2, '0');

      // Printing minutes and seconds
      for (int i = 2; i < str.length; ++i) {
        strNew += str[i];
      }
    }

    // After time is printed
    // cout Meridien
    strNew += " ";
    strNew += Meridien;
    return strNew;
  }
}
