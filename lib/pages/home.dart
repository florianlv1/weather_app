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

  @override
  Widget build(BuildContext context) {
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      print(data);
    }
    catch (e) {
      data = data;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_location),
                    Text("Edit Location"),
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
                  fontSize: 66.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
