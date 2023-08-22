import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app_with_bloc_pattern/bloc/ListingBloc/Listing_Bloc.dart';
import 'package:task_app_with_bloc_pattern/bloc/ListingBloc/Listing_Bloc_event.dart';
import 'package:task_app_with_bloc_pattern/bloc/ListingBloc/Listing_Bloc_state.dart';
import 'package:task_app_with_bloc_pattern/ui/AppConstants/AppTextStyles.dart';

import '../../respository/ListingRepository.dart';

class ListingScreen extends StatefulWidget {
  @override
  _ListingScreenState createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  late ListingRepository listingRepository;
  late ListingBloc listingBloc;

  @override
  void initState() {
    super.initState();
    listingRepository = ListingRepository();
    listingBloc = ListingBloc(listingRepository);
    listingBloc.add(FetchListingEvent());
  }

  @override
  void dispose() {
    listingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListingBloc>(
      create: (context) => listingBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Listing Screen',style: GoogleFonts.acme(textStyle: Titlename),),
        ),
        body: BlocBuilder<ListingBloc, ListingState>(
          builder: (context, state) {
            if (state is ListingInitialState || state is ListingLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ListingLoadedState) {
              final listingModel = state.listingModel;
              return Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: listingModel.data[0].contentList.length,
                      itemBuilder: (context, index) {
                        final ListingCard = listingModel.data;
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                            margin: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5.0,
                                ),
                                Center(child: Text(ListingCard[0].cardName,style:GoogleFonts.acme(textStyle:Moviename),)),
                                Container(
                                    child: Image.network(ListingCard[0].contentList[index].imageUrl,fit: BoxFit.cover,)),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Center(child: Text(ListingCard[0].contentList[index].name,style:GoogleFonts.acme(textStyle:Moviename),)),
                              ],
                            ),
                          );
                      },
                    ),
                  );

            } else if (state is ListingErrorState) {
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
