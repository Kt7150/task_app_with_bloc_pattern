import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app_with_bloc_pattern/respository/Bannerrepository.dart';

import '../../bloc/BannerBloc/Banner_Bloc.dart';
import '../../bloc/BannerBloc/Banner_Bloc_event.dart';
import '../../bloc/BannerBloc/Banner_Bloc_state.dart';
import '../AppConstants/AppTextStyles.dart';

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  late BannerRepository bannerRepository;
  late BannerBloc bannerBloc;

  @override
  void initState() {
    super.initState();
    bannerRepository = BannerRepository();
    bannerBloc = BannerBloc(bannerRepository);
    bannerBloc.add(FetchBannerEvent());
  }

  @override
  void dispose() {
    bannerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BannerBloc>(
      create: (context) => bannerBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Banner Screen',style: GoogleFonts.acme(textStyle: Titlename),),
        ),
        body: BlocBuilder<BannerBloc, BannerState>(
          builder: (context, state) {
            if (state is BannerInitialState || state is BannerLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BannerLoadedState) {
              final bannerModel = state.bannerModel;
              return Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: bannerModel.data[0].contentList.length,
                  itemBuilder: (context, index) {
                    final bannerCard = bannerModel.data[0].contentList[index];
                    return GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.network(bannerCard.imageUrl),
                            Text(bannerCard.name,style: GoogleFonts.acme(textStyle: Moviename),),
                            // Customize UI with other data
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is BannerErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
