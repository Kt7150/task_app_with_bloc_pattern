import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app_with_bloc_pattern/ui/AppConstants/AppTextStyles.dart';
import 'package:task_app_with_bloc_pattern/ui/Widgets/BannerWidgets.dart';
import 'package:task_app_with_bloc_pattern/ui/Widgets/ListingWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        title: Text("Gemplex",style: GoogleFonts.acme(textStyle: AppBarText),),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              height: MediaQuery.of(context).size.height*0.35,
                child: BannerScreen()),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                height: MediaQuery.of(context).size.height*0.5,
                child: ListingScreen()),
          ],
        ),
      )
    );
  }
}
