import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week4_project/home.dart';

class ScreenLogin extends StatelessWidget {
ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        actions: [
          IconButton(onPressed: (){
            signout(context);
          }, icon:Icon(Icons.exit_to_app),)
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx,index){
          return ListTile(
            title: Text('Person$index'),
            subtitle: Text('message'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://assets.architecturaldigest.in/photos/63806da6d2c4a1a597b273fd/1:1/w_960,c_limit/1442809583 '),
            ),
            trailing: Text('$index :00'),
          );
        },
         separatorBuilder: (ctx,index){
          return Divider();
         },
         itemCount: 10,
         ),
      ),
    );
  }

  signout(BuildContext ctx)async
  {
    final _sharedpreferens=await SharedPreferences.getInstance();
    await  _sharedpreferens.clear();

    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=>HomeScreen()), (route) => false);
  }

}