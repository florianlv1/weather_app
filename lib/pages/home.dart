import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Key? key;

  const Home({this.key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String bgImage = "night.jpeg";
  Color? bgColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
      print(data);

      // set background
      bgImage = data["isDaytime"] ?  "day.jpg" : "night.jpeg";
      bgColor = data["isDaytime"] ? Colors.blue: Colors.indigo[700];
    }
    catch (e) {
      data = data;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        "time" : result["time"],
                        "location": result["location"],
                        "isDaytime": result["isDaytime"],
                        "flag": result["flag"]
                      };
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_location,
                        color: Colors.grey[300] ,
                      ),
                      Text(
                          "Edit Location",
                        style: TextStyle(
                            color: Colors.grey[300]
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Accessing the "location" property safely using null-aware operator
                    Text(
                      data["location"] ?? "Unknown Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data["time"] ?? "Unknown Time",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 66.0
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
