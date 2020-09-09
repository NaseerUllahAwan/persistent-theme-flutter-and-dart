import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './AppStyleModeNotifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppStyleModeNotifier(),
        child: MaterialApp(
          title: 'persistent theme',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ThisApp(),
        ));
  }
}

class ThisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Scaffold(
      backgroundColor: appStyleMode.primaryBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appStyleMode.appBarBackgroundColor,
        actions: <Widget>[
          Switch(
            activeColor: Colors.orange,
            value: appStyleMode.mode,
            onChanged: (value) => appStyleMode.switchMode(),
          ),
        ],
        centerTitle: true,
        title: Text(
          "React Bits (Damodar Lohani)",
          style: TextStyle(
            color: appStyleMode.primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Container(
      color: appStyleMode.primaryBackgroundColor,
      child: Center(
        child: Text(
          'Thank you for your help React Bits (Damodar Lohani)',
          style: TextStyle(
            color: appStyleMode.dashboardTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
