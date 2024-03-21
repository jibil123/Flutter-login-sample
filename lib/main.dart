import 'package:flutter/material.dart';
import 'package:week4_project/splash.dart';

const SAVE_KEY_NAME='UserLogged';

void main(){
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'week4_project',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: ScreenSplash(),
    );
  }
}