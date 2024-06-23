import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer_timer/class/classAllCities.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({super.key});

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  Map data = {};
  final searchboxController = TextEditingController();
  List Cities = [
    "South Sinai",
    "New Valley",
    "Matruh",
    "Red Sea",
    "Giza",
    "Nourth Sinai",
    "Suez",
    "Beheira",
    "Helwan",
    "Sharqia",
    "Dakahlia",
    "Kafr el-Sheikh",
    "Alexandria",
    "Monufia",
    "Minya",
    "Gharbia",
    "Faiyum",
    "Qena",
    "Asyut",
    "Sohag",
    "Beni Suef",
    "Qalyubia",
    "Aswan",
    "Damietta",
    "Cairo",
    "Port Said",
    "Luxor",
    "6th of October"
  ];
  List foundCities = [];
  void runFilter(String keyword) {
    List results = [];
    if (keyword.isEmpty) {
      results = Cities;
    } else {
      results = Cities.where((element) =>
          element.toLowerCase().contains(keyword.toLowerCase())).toList();
    }
    setState(() {
      foundCities = results;
    });
  }

  void initState() {
    foundCities = Cities;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/F2 BG3.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              
              Spacer(
                flex: 4,
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
                flex: 13,
              ),
              Container(
                height: 50,
                width: 300,
                padding: EdgeInsets.only(right: 20, left: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 10))
                    ]),
                child: TextField(
                    onChanged: (value) => {runFilter(value)},
                    controller: searchboxController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 39,
                        color: Color.fromRGBO(18, 3, 51, 0.6),
                      ),

                      border: InputBorder.none,
                      hintText: "Search By CityName",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(18, 3, 51, 0.4), fontSize: 16),

                      // hintStyle: TextStyle()
                    )),
              ),
              Container(
                  height: 90,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foundCities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                AllCities oneCity =
                                    AllCities(link: foundCities[index]);
                                await oneCity.getData();
                                Navigator.pushReplacementNamed(
                                    context, '/timeCity',
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
                                padding: EdgeInsets.all(4),
                                child: Text(foundCities[index]),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                          blurRadius: 4,
                                          offset: Offset(0, 4))
                                    ],
                                    color: Color.fromRGBO(255, 247, 247, 0.7),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        );
                      })
                  //   child: SingleChildScrollView(

                  //       scrollDirection: Axis.horizontal,
                  //       child: Row(children: [
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () async {
                  //             AllCities oneCity = AllCities(link: Cities[0]);
                  //             await oneCity.getData();
                  //             Navigator.pushReplacementNamed(context, '/timeCity',
                  //                 arguments: {
                  //                   "timeFajr": oneCity.timeFajr,
                  //                   "timeSunrise": oneCity.timeSunrise,
                  //                   "timeDhuhr": oneCity.timeDhuhr,
                  //                   "timeAsr": oneCity.timeAsr,
                  //                   "timeMaghrib": oneCity.timeMaghrib,
                  //                   "timeIsha": oneCity.timeIsha,
                  //                   "nameCity": oneCity.link,
                  //                   "date1M": oneCity.date1M,
                  //                   "date2H": oneCity.date2H,
                  //                 });
                  //           },
                  //           child: Container(
                  //             padding: EdgeInsets.all(4),
                  //             child: Text(Cities[0]),
                  //             decoration: BoxDecoration(
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Color.fromRGBO(0, 0, 0, 0.25),
                  //                       blurRadius: 4,
                  //                       offset: Offset(0, 4))
                  //                 ],
                  //                 color: Color.fromRGBO(255, 247, 247, 0.7),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () async {
                  //             AllCities oneCity = AllCities(link: Cities[1]);
                  //             await oneCity.getData();
                  //             Navigator.pushReplacementNamed(context, '/timeCity',
                  //                 arguments: {
                  //                   "timeFajr": oneCity.timeFajr,
                  //                   "timeSunrise": oneCity.timeSunrise,
                  //                   "timeDhuhr": oneCity.timeDhuhr,
                  //                   "timeAsr": oneCity.timeAsr,
                  //                   "timeMaghrib": oneCity.timeMaghrib,
                  //                   "timeIsha": oneCity.timeIsha,
                  //                   "nameCity": oneCity.link,
                  //                   "date1M": oneCity.date1M,
                  //                   "date2H": oneCity.date2H,
                  //                 });
                  //           },
                  //           child: Container(
                  //             padding: EdgeInsets.all(4),
                  //             child: Text(Cities[1]),
                  //             decoration: BoxDecoration(
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Color.fromRGBO(0, 0, 0, 0.25),
                  //                       blurRadius: 4,
                  //                       offset: Offset(0, 4))
                  //                 ],
                  //                 color: Color.fromRGBO(255, 247, 247, 0.7),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () async {
                  //             AllCities oneCity = AllCities(link: Cities[2]);
                  //             await oneCity.getData();
                  //             Navigator.pushReplacementNamed(context, '/timeCity',
                  //                 arguments: {
                  //                   "timeFajr": oneCity.timeFajr,
                  //                   "timeSunrise": oneCity.timeSunrise,
                  //                   "timeDhuhr": oneCity.timeDhuhr,
                  //                   "timeAsr": oneCity.timeAsr,
                  //                   "timeMaghrib": oneCity.timeMaghrib,
                  //                   "timeIsha": oneCity.timeIsha,
                  //                   "nameCity": oneCity.link,
                  //                   "date1M": oneCity.date1M,
                  //                   "date2H": oneCity.date2H,
                  //                 });
                  //           },
                  //           child: Container(
                  //             padding: EdgeInsets.all(4),
                  //             child: Text(Cities[2]),
                  //             decoration: BoxDecoration(
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Color.fromRGBO(0, 0, 0, 0.25),
                  //                       blurRadius: 4,
                  //                       offset: Offset(0, 4))
                  //                 ],
                  //                 color: Color.fromRGBO(255, 247, 247, 0.7),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () async {
                  //             AllCities oneCity = AllCities(link: Cities[3]);
                  //             await oneCity.getData();
                  //             Navigator.pushReplacementNamed(context, '/timeCity',
                  //                 arguments: {
                  //                   "timeFajr": oneCity.timeFajr,
                  //                   "timeSunrise": oneCity.timeSunrise,
                  //                   "timeDhuhr": oneCity.timeDhuhr,
                  //                   "timeAsr": oneCity.timeAsr,
                  //                   "timeMaghrib": oneCity.timeMaghrib,
                  //                   "timeIsha": oneCity.timeIsha,
                  //                   "nameCity": oneCity.link,
                  //                   "date1M": oneCity.date1M,
                  //                   "date2H": oneCity.date2H,
                  //                 });
                  //           },
                  //           child: Container(
                  //             padding: EdgeInsets.all(4),
                  //             child: Text(Cities[3]),
                  //             decoration: BoxDecoration(
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Color.fromRGBO(0, 0, 0, 0.25),
                  //                       blurRadius: 4,
                  //                       offset: Offset(0, 4))
                  //                 ],
                  //                 color: Color.fromRGBO(255, 247, 247, 0.7),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () async {
                  //             AllCities oneCity = AllCities(link: Cities[4]);
                  //             await oneCity.getData();
                  //             Navigator.pushReplacementNamed(context, '/timeCity',
                  //                 arguments: {
                  //                   "timeFajr": oneCity.timeFajr,
                  //                   "timeSunrise": oneCity.timeSunrise,
                  //                   "timeDhuhr": oneCity.timeDhuhr,
                  //                   "timeAsr": oneCity.timeAsr,
                  //                   "timeMaghrib": oneCity.timeMaghrib,
                  //                   "timeIsha": oneCity.timeIsha,
                  //                   "nameCity": oneCity.link,
                  //                   "date1M": oneCity.date1M,
                  //                   "date2H": oneCity.date2H,
                  //                 });
                  //           },
                  //           child: Container(
                  //             padding: EdgeInsets.all(4),
                  //             child: Text(Cities[4]),
                  //             decoration: BoxDecoration(
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Color.fromRGBO(0, 0, 0, 0.25),
                  //                       blurRadius: 4,
                  //                       offset: Offset(0, 4))
                  //                 ],
                  //                 color: Color.fromRGBO(255, 247, 247, 0.7),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () async {
                  //             AllCities oneCity = AllCities(link: Cities[5]);
                  //             await oneCity.getData();
                  //             Navigator.pushReplacementNamed(context, '/timeCity',
                  //                 arguments: {
                  //                   "timeFajr": oneCity.timeFajr,
                  //                   "timeSunrise": oneCity.timeSunrise,
                  //                   "timeDhuhr": oneCity.timeDhuhr,
                  //                   "timeAsr": oneCity.timeAsr,
                  //                   "timeMaghrib": oneCity.timeMaghrib,
                  //                   "timeIsha": oneCity.timeIsha,
                  //                   "nameCity": oneCity.link,
                  //                   "date1M": oneCity.date1M,
                  //                   "date2H": oneCity.date2H,
                  //                 });
                  //           },
                  //           child: Container(
                  //             padding: EdgeInsets.all(4),
                  //             child: Text(Cities[5]),
                  //             decoration: BoxDecoration(
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Color.fromRGBO(0, 0, 0, 0.25),
                  //                       blurRadius: 4,
                  //                       offset: Offset(0, 4))
                  //                 ],
                  //                 color: Color.fromRGBO(255, 247, 247, 0.7),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () async {
                  //             AllCities oneCity = AllCities(link: Cities[6]);
                  //             await oneCity.getData();
                  //             Navigator.pushReplacementNamed(context, '/timeCity',
                  //                 arguments: {
                  //                   "timeFajr": oneCity.timeFajr,
                  //                   "timeSunrise": oneCity.timeSunrise,
                  //                   "timeDhuhr": oneCity.timeDhuhr,
                  //                   "timeAsr": oneCity.timeAsr,
                  //                   "timeMaghrib": oneCity.timeMaghrib,
                  //                   "timeIsha": oneCity.timeIsha,
                  //                   "nameCity": oneCity.link,
                  //                   "date1M": oneCity.date1M,
                  //                   "date2H": oneCity.date2H,
                  //                 });
                  //           },
                  //           child: Container(
                  //             padding: EdgeInsets.all(4),
                  //             child: Text(Cities[6]),
                  //             decoration: BoxDecoration(
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Color.fromRGBO(0, 0, 0, 0.25),
                  //                       blurRadius: 4,
                  //                       offset: Offset(0, 4))
                  //                 ],
                  //                 color: Color.fromRGBO(255, 247, 247, 0.7),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () async {
                  //             AllCities oneCity = AllCities(link: Cities[7]);
                  //             await oneCity.getData();
                  //             Navigator.pushReplacementNamed(context, '/timeCity',
                  //                 arguments: {
                  //                   "timeFajr": oneCity.timeFajr,
                  //                   "timeSunrise": oneCity.timeSunrise,
                  //                   "timeDhuhr": oneCity.timeDhuhr,
                  //                   "timeAsr": oneCity.timeAsr,
                  //                   "timeMaghrib": oneCity.timeMaghrib,
                  //                   "timeIsha": oneCity.timeIsha,
                  //                   "nameCity": oneCity.link,
                  //                   "date1M": oneCity.date1M,
                  //                   "date2H": oneCity.date2H,
                  //                 });
                  //           },
                  //           child: Container(
                  //             padding: EdgeInsets.all(4),
                  //             child: Text(Cities[7]),
                  //             decoration: BoxDecoration(
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Color.fromRGBO(0, 0, 0, 0.25),
                  //                       blurRadius: 4,
                  //                       offset: Offset(0, 4))
                  //                 ],
                  //                 color: Color.fromRGBO(255, 247, 247, 0.7),
                  //                 borderRadius: BorderRadius.circular(10)),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //       ])),
                  //
                  ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("suggestion...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w900)),
                ],
              ),
              Spacer(
                flex: 5,
              ),
              Container(
                child: Text(data["nameCity"],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w900)),
              ),
              Spacer(
                flex: 14,
              ),
              Expanded(
                flex:30 ,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // Spacer(
                      //   flex: 3,
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SafeArea(
                            child: Container(
                              height: 423,
                              width: 600,
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
                                        flex: 7,
                                      ),
                                      Spacer(
                                        flex: 8,
                                      ),
                                      Container(
                                        width: 240,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 242, 242, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      50, 0, 0, 0),
                                                  blurStyle: BlurStyle.solid,
                                                  offset: Offset(0, 2.6),
                                                  blurRadius: 4)
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Fajr     ".toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              data["timeFajr"].toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "الفجر",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                                            color: Color.fromRGBO(
                                                255, 242, 242, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      50, 0, 0, 0),
                                                  blurStyle: BlurStyle.solid,
                                                  offset: Offset(0, 2.6),
                                                  blurRadius: 4)
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Sunrise  ".toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              data["timeSunrise"].toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "الشروق",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                                            color: Color.fromRGBO(
                                                255, 242, 242, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      50, 0, 0, 0),
                                                  blurStyle: BlurStyle.solid,
                                                  offset: Offset(0, 2.6),
                                                  blurRadius: 4)
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Dzuhur".toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              data["timeDhuhr"].toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "الظهر",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                                            color: Color.fromRGBO(
                                                255, 242, 242, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      50, 0, 0, 0),
                                                  blurStyle: BlurStyle.solid,
                                                  offset: Offset(0, 2.6),
                                                  blurRadius: 4)
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Ashar   ".toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              data["timeAsr"].toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "العصر",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                                            color: Color.fromRGBO(
                                                255, 242, 242, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      50, 0, 0, 0),
                                                  blurStyle: BlurStyle.solid,
                                                  offset: Offset(0, 2.6),
                                                  blurRadius: 4)
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Maghrib".toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              data["timeMaghrib"].toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "المغرب",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                                            color: Color.fromRGBO(
                                                255, 242, 242, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      50, 0, 0, 0),
                                                  blurStyle: BlurStyle.solid,
                                                  offset: Offset(0, 2.6),
                                                  blurRadius: 4)
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "isha       ".toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              data["timeIsha"].toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "العشاء",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
