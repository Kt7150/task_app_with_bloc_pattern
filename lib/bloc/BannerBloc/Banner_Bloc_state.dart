

import '../../model/BannerModel.dart'; // Import your BannerModel

abstract class BannerState {}

class BannerInitialState extends BannerState {}

class BannerLoadingState extends BannerState {}

class BannerLoadedState extends BannerState {
  final BannerModel bannerModel;

  BannerLoadedState(this.bannerModel);
}

class BannerErrorState extends BannerState {
  final String error;

  BannerErrorState(this.error);
}
