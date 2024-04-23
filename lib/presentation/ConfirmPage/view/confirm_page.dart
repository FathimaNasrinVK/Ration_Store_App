import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../controller/cntrlr.dart';
import '../../../core/constants/color.dart';
import '../../../global_widget/confirm_widget.dart';

class Confirm_page extends StatelessWidget {
  String category;
  Confirm_page({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.maincolor,
        title: Text(category,style: TextStyle(color: Colors.white),),centerTitle: true,
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop();
        },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white)
        ),
      ),
      body: Consumer<tile_controller>(
        builder: (context, provider, _) {
          List<Map<String, dynamic>> collection = provider.collection;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: collection.length,
              itemBuilder: (BuildContext context, int index) {
                return Confirm_Item_Widget(
                  item: collection[index],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: Container(color: ColorTheme.maincolor,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                  child: Text("Total Amount: ₹${Provider.of<tile_controller>(context).total}",style:TextStyle(
                      fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,)),
            ),
            Container(width: 130,
                child: FloatingActionButton(onPressed: (){
                    // Generate and show QR code on button press
                    _showQRDialog(context);

                },
                  child: Text("CONFIRM",style:TextStyle(
                      fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5)),
                  backgroundColor: ColorTheme.maincolor,
                  elevation: 0,)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void _showQRDialog(BuildContext context) {
  // Extract data to encode into QR code
  List<Map<String, dynamic>> collection = Provider.of<tile_controller>(context, listen: false).collection;
  // Encode data into a single string
  String dataToEncode = collection.toString();

  // Generate QR code widget
  Widget qrWidget = QrImageView(
    data: dataToEncode,
    version: QrVersions.auto,
    size: 200.0,
  );

  // Show QR code in a dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("QR Code"),
        content: Container(
          height: 250,
          width: 250,
          child: qrWidget,
        ),
        actions:[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Close"),
          ),

        ],
      );
    },
  );
}
