import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../respository/Bannerrepository.dart';
import 'Banner_Bloc_event.dart';
import 'Banner_Bloc_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;

  BannerBloc(this.bannerRepository) : super(BannerInitialState());

  @override
  Stream<BannerState> mapEventToState(BannerEvent event) async* {
    if (event is FetchBannerEvent) {
      yield* _mapFetchBannerEventToState();
    }
  }

  Stream<BannerState> _mapFetchBannerEventToState() async* {
    yield BannerLoadingState();
    try {
      final bannerData = await bannerRepository.fetchBannerData();
      yield BannerLoadedState(bannerData);
    } catch (e) {
      yield BannerErrorState("Failed to fetch banner data");
    }
  }
}
