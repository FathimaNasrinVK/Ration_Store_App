import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/cntrlr.dart';
import '../core/constants/color.dart';


class Item_Widget extends StatelessWidget {
  Map<String, dynamic> item = {};

  Item_Widget({super.key,
    required this.item,
  });


  @override
  Widget build(BuildContext context) {
    return Consumer<tile_controller>(builder: (context, provider, child) {
      return InkWell(
        onTap: (){
          provider.toggleTile(item['Name']);
          provider.togglenamelist(item,item['Name']);
        },
        child: Padding(padding: EdgeInsets.all(10),
            child:Container(
              decoration: BoxDecoration(color:
              provider.selectedTileIndices.contains(item['Name'])?
              ColorTheme.maincolor:Colors.white,
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
                        image: NetworkImage("${item['Image']}"),fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Item : ${item['Name']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                color:  provider.selectedTileIndices.contains(item['Name'])? Colors.white:ColorTheme.maincolor),),
                            Text("Price/Kg : ₹${item['Price']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                color: provider.selectedTileIndices.contains(item['Name'])? Colors.white:ColorTheme.maincolor),),
                            Text("Weight : ${item['Quantity']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                color:  provider.selectedTileIndices.contains(item['Name'])? Colors.white:ColorTheme.maincolor),),
                            Text("Total Price : ₹${item['TotalPrice']}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
                                color:  provider.selectedTileIndices.contains(item['Name'])? Colors.white:ColorTheme.maincolor),),
                          ]))
                ],
              ),
            )),
      );});
  }
}