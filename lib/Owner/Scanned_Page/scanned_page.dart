import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/constants/color.dart';
import '../../global_widget/confirm_widget.dart';

class ScannedDataDisplayScreen extends StatelessWidget {
  final String scannedData;

  const ScannedDataDisplayScreen({required this.scannedData});

  @override
  Widget build(BuildContext context) {
    // Decode the scanned data (assuming it's in JSON format)
    List<Map<String, dynamic>> decodedData = List<Map<String, dynamic>>.from(jsonDecode(scannedData));
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanned Data"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
        ),
        itemCount: decodedData.length,
        itemBuilder: (BuildContext context, int index) {
          final data = decodedData[index];
          return  Padding(padding: EdgeInsets.all(10),
              child:Container(
                decoration: BoxDecoration(color: ColorTheme.maincolor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: ColorTheme.maincolor, // Set border color here
                    width: 2.0, // Set border width here
                  ),),
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 250,
                      decoration: BoxDecoration(image: DecorationImage(
                          image: NetworkImage("${decodedData[index]['Image'].toString()}"),fit: BoxFit.fill),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Item : ${decodedData[index]['Name']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                  color:Colors.white),),
                              Text("Price/Kg : ₹${decodedData[index]['Price']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                  color:Colors.white),),
                              Text("Weight : ${decodedData[index]['Quantity']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                  color:Colors.white),),
                              Text("Total Price : ₹${decodedData[index]['TotalPrice']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                  color:Colors.white),),
                            ]))
                  ],
                ),
              ));
        },
      ),
    );
  }
}