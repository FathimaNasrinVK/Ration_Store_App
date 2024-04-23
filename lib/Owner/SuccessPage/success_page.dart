import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ration_app/core/constants/color.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: Success_Page(),));
}

class Success_Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.maincolor,
      body:Center(
        child: Column(
          children: [
            Lottie.asset('assets/animations/success.json',height: 200),
            Text("Payment Successful !",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
