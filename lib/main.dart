import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ration_app/controller/cntrlr.dart';
import 'package:ration_app/presentation/First_Page/view/firstpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBZODRyFPH_Ruk71E8PEDazVKlYTaGgspQ",
        appId: "1:703914976111:android:a1a8a2eb69c7a59c667e9a",
        messagingSenderId: "",
        projectId: "rationapp-8d308",
        storageBucket: "rationapp-8d308.appspot.com",
    )
  );
  runApp(mainpage());
}
 class mainpage extends StatelessWidget {
   const mainpage({super.key});

   @override
   Widget build(BuildContext context) {
     return ChangeNotifierProvider(
         create: (context)=>tile_controller(),
       child: MaterialApp(debugShowCheckedModeBanner: false,home: user_owner_selection(),),
     );
   }
 }
