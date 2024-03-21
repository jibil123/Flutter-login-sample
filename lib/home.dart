import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week4_project/login.dart';
import 'package:week4_project/main.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final _usernameConroller=TextEditingController();
  final _passwordController=TextEditingController();
  
  final _usernm='jibil';
  final _userpas='jibilpt';

  final _formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page'),
      ),
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
          
                  controller: _usernameConroller,
                  decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'enter user name'
                  ),
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return 'value is empty';
                    }
                    else{
                      return null;
                    }
                  } ,
                ),
              ),
              
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                 decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter password'
                ),
                 validator: (value) {
                    if(value==null||value.isEmpty){
                      return 'value is empty';
                    }
                    else{
                      return null;
                    }
                  } ,
              ),
              SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                    checklogin(context);
                  }
                  else{
                    print('empty');
                  }
                  
                },
               icon:const Icon(Icons.check),
               label:const Text('login'),
              ),
             ],
            ),
          ),
        ),
      ),
    );
  }

  void checklogin( BuildContext cont)async{
    final _username=_usernameConroller.text;
    final _password=_passwordController.text;
    if(_username==_usernm&& _password==_userpas){
      print('user and pas correct');
    
      
      final _sharedpreferens=await SharedPreferences.getInstance();
      await _sharedpreferens.setBool(SAVE_KEY_NAME,true);
       
       Navigator.of(cont)
       .pushReplacement(MaterialPageRoute(builder: (ctx)=>ScreenLogin()));
    }
    else{
      final _errormassage="password incorrect";

      ScaffoldMessenger.of(cont)
      .showSnackBar(SnackBar(content: Text(_errormassage)
       )
      );
    }
    }
  }
