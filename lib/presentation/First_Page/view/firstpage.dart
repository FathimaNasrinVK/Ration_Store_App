import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ration_app/Owner/ScanningPage/scannning_page.dart';
import 'package:ration_app/controller/cntrlr.dart';
import '../../../core/constants/color.dart';
import '../../second_page/view/secondpage.dart';



class First_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size*350,),
            Container(
              height: size*50,
              width:  size*200,
              child: ElevatedButton(
                onPressed: () {
                  final provider  = Provider.of<tile_controller>(context,listen:false) ;
                  provider.clearCollectiion();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SecondPage()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: ColorTheme.maincolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

                child: Text(
                  "USER",
                  style: TextStyle(color: ColorTheme.primarycolor, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: size*25,),
            Container(
              height: size*50,
              width:  size*200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> QR_Scanner()));

                },
                style: ElevatedButton.styleFrom(backgroundColor: ColorTheme.maincolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

                child: Text(
                  "OWNER",
                  style: TextStyle(color: ColorTheme.primarycolor, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}