import 'package:flutter_maps/data/models/PlaceSuggestion.dart';
import 'package:flutter_maps/data/models/place.dart';
import 'package:flutter_maps/data/models/place_directions.dart';
import 'package:flutter_maps/data/webservices/PlacesWebservices.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsRepository {
  final PlacesWebServices placesWebServices;

  MapsRepository(this.placesWebServices);

  Future<List<PlaceSuggestion>> fetchSuggestions(
      String place, String sessionToken) async {
    final suggestions =
        await placesWebServices.fetchSuggestions(place, sessionToken);

    return suggestions
        .map((suggestions) => PlaceSuggestion.fromJson(suggestions))
        .toList();
  }

  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
    final place =
        await placesWebServices.getPlaceLocation(placeId, sessionToken);
    // var readyPlace = Place.fromjson(place);
    return Place.fromjson(place);
  }

  Future<PlaceDirections> getDirections(
      LatLng origin, LatLng destination) async {
    final directions =
        await placesWebServices.getDirections(origin, destination);
    // var readyPlace = Place.fromjson(place);
    return PlaceDirections.fromjson(directions);
  }
}
