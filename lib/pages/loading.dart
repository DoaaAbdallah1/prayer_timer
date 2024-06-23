import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prayer_timer/class/classAllCities.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  getDataLoadingPage() async {
    //  info about time

    AllCities oneCity = AllCities(link: "cairo");

    await oneCity.getData();

    Navigator.pushReplacementNamed(context, '/homeStart', arguments: {
      "timeFajr": oneCity.timeFajr,
      "timeSunrise": oneCity.timeSunrise,
      "timeDhuhr": oneCity.timeDhuhr,
      "timeAsr": oneCity.timeAsr,
      "timeMaghrib": oneCity.timeMaghrib,
      "timeIsha": oneCity.timeIsha,
      "azanName": oneCity.nameAzan[oneCity.indexMinTime],
      "date1M": oneCity.date1M,
      "date2H": oneCity.date2H,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/back ground frame 1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Spacer(
                flex: 10,
              ),
              Text(
                "Parying",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("continue",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                  SpinKitThreeBounce(
                    color: Colors.white,
                    duration: Duration(milliseconds: 600),
                    size: 15,
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
