import 'package:bloc/bloc.dart';
import 'package:flutter_maps/data/models/PlaceSuggestion.dart';
import 'package:flutter_maps/data/repository/maps_repo.dart';
import 'package:meta/meta.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsRepository mapsRepository;
  MapsCubit(this.mapsRepository) : super(MapsInitial());

  void emitPlaceSuggestions(String place, String sessionToken) {
    mapsRepository.fetchSuggestions(place, sessionToken).then((suggestions) {
      emit(PlacesLoaded(suggestions));
    });
  }
}