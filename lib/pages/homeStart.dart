import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer_timer/class/classAllCities.dart';

class HomeStartPoint extends StatefulWidget {
  const HomeStartPoint({super.key});

  @override
  State<HomeStartPoint> createState() => _HomeStartPointState();
}

class _HomeStartPointState extends State<HomeStartPoint> {
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
                flex: 4,
              ),
              Container(
                child: Text("Praying Time",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                child: Text("Current Paryer",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          "Start",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          data["timeFajr"].toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(110, 123, 97, 172),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          "End",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          data["timeIsha"].toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(110, 123, 97, 172),
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
              Spacer(
                flex: 4,
              )
            ]),
          ),
          SafeArea(
            child: Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Column(
                  children: [
                    Spacer(
                      flex: 11,
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(50, 0, 0, 0),
                                blurStyle: BlurStyle.solid,
                                offset: Offset(0, 2.6),
                                blurRadius: 4)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  AllCities oneCity = AllCities(link: "Cairo");
                                  await oneCity.getData();
                                  Navigator.pushReplacementNamed(
                                      context, '/selectCity',
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
                                child: Container(
                                  height: 100,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/img/B1.png"),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 100,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/img/B2.png"),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 100,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/img/B3.png"),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 100,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/img/B4.png"),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
