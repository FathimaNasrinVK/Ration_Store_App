import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/color.dart';
import '../controller/cntrlr.dart';

class Item_Widget extends StatelessWidget {
  Map<String, dynamic> item = {};

  Item_Widget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Consumer<tile_controller>(builder: (context, provider, child) {
      return InkWell(
        onTap: () {
          provider.toggleTile(item['Name']);
          provider.togglenamelist(item, item['Name']);
        },
        child: Padding(
            padding: EdgeInsets.all(size * 10),
            child: Container(
              decoration: BoxDecoration(
                color: provider.selectedTileIndices.contains(item['Name'])
                    ? ColorTheme.maincolor
                    : Colors.white,
                borderRadius: BorderRadius.circular(size * 20),
                border: Border.all(
                  color: ColorTheme.maincolor, // Set border color here
                  width: size * 2, // Set border width here
                ),
              ),
              width: size * 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size * 150,
                    width: size * 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("${item['Image']}"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(size * 20),
                            topRight: Radius.circular(size * 20))),
                  ),
                  Padding(
                      padding: EdgeInsets.all(size * 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Item : ${item['Name']}",
                              style: TextStyle(
                                  fontSize: size * 15,
                                  fontWeight: FontWeight.bold,
                                  color: provider.selectedTileIndices
                                      .contains(item['Name'])
                                      ? Colors.white
                                      : ColorTheme.maincolor),
                            ),
                            Text(
                              "Price/Kg : ₹${item['Price']}",
                              style: TextStyle(
                                  fontSize: size * 15,
                                  fontWeight: FontWeight.bold,
                                  color: provider.selectedTileIndices
                                      .contains(item['Name'])
                                      ? Colors.white
                                      : ColorTheme.maincolor),
                            ),
                            Text(
                              "Weight : ${item['Quantity']}",
                              style: TextStyle(
                                  fontSize: size * 15,
                                  fontWeight: FontWeight.bold,
                                  color: provider.selectedTileIndices
                                      .contains(item['Name'])
                                      ? Colors.white
                                      : ColorTheme.maincolor),
                            ),
                            Text(
                              "Total Price : ₹${item['TotalPrice']}",
                              style: TextStyle(
                                  fontSize: size * 15,
                                  fontWeight: FontWeight.bold,
                                  color: provider.selectedTileIndices
                                      .contains(item['Name'])
                                      ? Colors.white
                                      : ColorTheme.maincolor),
                            ),
                          ]))
                ],
              ),
            )),
      );
    });
  }
}
