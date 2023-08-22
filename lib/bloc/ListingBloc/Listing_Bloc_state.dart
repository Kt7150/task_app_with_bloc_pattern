

import '../../model/ListingModel.dart'; // Import your listingModel

abstract class ListingState {}

class ListingInitialState extends ListingState {}

class ListingLoadingState extends ListingState {}

class ListingLoadedState extends ListingState {
  final ListingModel listingModel;

  ListingLoadedState(this.listingModel);
}

class ListingErrorState extends ListingState {
  final String error;

  ListingErrorState(this.error);
}
