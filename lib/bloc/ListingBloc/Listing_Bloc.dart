import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../respository/ListingRepository.dart';
import 'Listing_Bloc_event.dart';
import 'Listing_Bloc_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final ListingRepository listingRepository;

  ListingBloc(this.listingRepository) : super(ListingInitialState());

  @override
  Stream<ListingState> mapEventToState(ListingEvent event) async* {
    if (event is FetchListingEvent) {
      yield* _mapFetchLsitingEventToState();
    }
  }

  Stream<ListingState> _mapFetchLsitingEventToState() async* {
    yield ListingLoadingState();
    try {
      final listingData = await listingRepository.fetchListingData();
      print(listingData);
      yield ListingLoadedState(listingData);
    } catch (e) {
      yield ListingErrorState("Failed to fetch Listing data");
    }
  }
}
