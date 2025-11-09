import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 169, 170, 170),
            title: const Text("My Hobbies"),
          ),
          body: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyNewWidget(
                  text: "Sea",
                  icon: Icons.beach_access_outlined,
                  color: Colors.blue[100]!,
                ),
                SizedBox(height: 10),
                MyNewWidget(
                  text: "Mountain",
                  icon: Icons.travel_explore,
                  color: Colors.blue[100]!,
                ),
                SizedBox(height: 10),
                MyNewWidget(
                  text: "Forest",
                  icon: Icons.forest_rounded,
                  color: Colors.blue[100]!,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class MyNewWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const MyNewWidget({
    super.key,
    required this.text,
    required this.icon,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              Icon(icon, color: Colors.white),
              SizedBox(width: 10.0),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
