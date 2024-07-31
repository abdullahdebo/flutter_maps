import 'package:flutter_maps/data/models/PlaceSuggestion.dart';
import 'package:flutter_maps/data/webservices/PlacesWebservices.dart';

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
}
