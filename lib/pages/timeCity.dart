import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer_timer/class/classAllCities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimeCity extends StatefulWidget {
  const TimeCity({super.key});

  @override
  State<TimeCity> createState() => _TimeCityState();
}

class _TimeCityState extends State<TimeCity> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 578,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/background frame 2.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(data["date2H"],
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Container(
                    padding: EdgeInsets.only(left: 8, right: 17),
                    width: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(70, 217, 217, 217),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 24,
                        ),
                        Text(
                          "Egypt",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Spacer(
                flex: 5,
              ),
              Container(
                  child: Row(
                children: [
                  Spacer(
                    flex: 12,
                  ),
                  IconButton(
                    onPressed: () async {
                      AllCities oneCity = AllCities(link: "Cairo");
                      await oneCity.getData();
                      Navigator.pushReplacementNamed(context, '/selectCity',
                          arguments: {
                            "timeFajr": oneCity.timeFajr,
                            "timeSunrise": oneCity.timeSunrise,
                            "timeDhuhr": oneCity.timeDhuhr,
                            "timeAsr": oneCity.timeAsr,
                            "timeMaghrib": oneCity.timeMaghrib,
                            "timeIsha": oneCity.timeIsha,
                            "nameCity": oneCity.link,
                            "date1M": oneCity.date1M,
                            "date2H": oneCity.date2H,
                          });
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.circleArrowLeft,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(data["nameCity"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w900)),
                  Spacer(
                    flex: 20,
                  ),
                ],
              )),
              SizedBox(
                height: 7,
              ),
              Container(
                child: Text("Current Paryer",
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              ),
              Spacer(
                flex: 7,
              ),
            ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SafeArea(
                child: Container(
                  height: 480,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/BoxCity.png"),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 3,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 320,
                        width: 70,
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage("assets/img/Sun.png"),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Spacer(
                            flex: 16,
                          ),
                          Container(
                            width: 240,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 242, 242, 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(50, 0, 0, 0),
                                      blurStyle: BlurStyle.solid,
                                      offset: Offset(0, 2.6),
                                      blurRadius: 4)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Fajr     ".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  data["timeFajr"].toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "الفجر",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Container(
                            width: 240,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 242, 242, 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(50, 0, 0, 0),
                                      blurStyle: BlurStyle.solid,
                                      offset: Offset(0, 2.6),
                                      blurRadius: 4)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Sunrise  ".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  data["timeSunrise"].toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "الشروق",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Container(
                            width: 240,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 242, 242, 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(50, 0, 0, 0),
                                      blurStyle: BlurStyle.solid,
                                      offset: Offset(0, 2.6),
                                      blurRadius: 4)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Dzuhur".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  data["timeDhuhr"].toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "الظهر",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Container(
                            width: 240,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 242, 242, 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(50, 0, 0, 0),
                                      blurStyle: BlurStyle.solid,
                                      offset: Offset(0, 2.6),
                                      blurRadius: 4)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Ashar   ".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  data["timeAsr"].toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "العصر",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Container(
                            width: 240,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 242, 242, 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(50, 0, 0, 0),
                                      blurStyle: BlurStyle.solid,
                                      offset: Offset(0, 2.6),
                                      blurRadius: 4)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Maghrib".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  data["timeMaghrib"].toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "المغرب",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Container(
                            width: 240,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 242, 242, 1),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(50, 0, 0, 0),
                                      blurStyle: BlurStyle.solid,
                                      offset: Offset(0, 2.6),
                                      blurRadius: 4)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "isha       ".toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  data["timeIsha"].toUpperCase(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "العشاء",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 11,
                          )
                        ],
                      ),
                      Spacer(
                        flex: 7,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 430,
            left: 200,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromRGBO(18, 3, 51, 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
