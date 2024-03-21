

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week4_project/home.dart';
import 'package:week4_project/login.dart';
import 'package:week4_project/main.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  
  @override
  void initState() {
    checklog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Loading...'),
      ),
    );
  }

  Future<void>gotologin()async{
    await Future.delayed(Duration(seconds: 2),);
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomeScreen()));
  }

    Future<void>checklog()async{
      final _sharedpreferens=await SharedPreferences.getInstance();
      final _userlogged= _sharedpreferens.getBool(SAVE_KEY_NAME);
      if(_userlogged==null||_userlogged==false){
        gotologin();
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=>ScreenLogin()));
      }
    }
}