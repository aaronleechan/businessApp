import 'package:business_application/blocs/auth_bloc.dart';
import 'package:business_application/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState(){
    // TODO: implement initStat
    var authBloc = Provider.of<AuthBloc>(context,listen: false);
    authBloc.currentUser.listen((event) {
      if(event == null){
        Navigator.pushNamed(context, SignInScreen.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Home Screen"),centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: ()  => authBloc.logout())
        ],
      ),
    );
  }
}
