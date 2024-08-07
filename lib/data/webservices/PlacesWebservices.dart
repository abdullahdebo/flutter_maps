import 'package:dio/dio.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesWebServices {
  late Dio dio;

  PlacesWebServices() {
    BaseOptions options = BaseOptions(
      connectTimeout: Duration(seconds: 20000),
      receiveTimeout: Duration(seconds: 20000),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchSuggestions(
      String place, String sessionToken) async {
    try {
      Response response = await dio.get(
        suggestionsBaseUrl,
        queryParameters: {
          'input': place,
          'type': 'address',
          'components': 'country:sa',
          'key': googleApiKey,
          'sessiontoken': sessionToken,
        },
      );
      print(response.data['predictions']);
      print(response.statusCode);
      return response.data['predictions'];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<dynamic> getPlaceLocation(String placeId, String sessionToken) async {
    try {
      Response response = await dio.get(
        placeLocationBaseUrl,
        queryParameters: {
          'place_id': placeId,
          'fields': 'geometry',
          'key': googleApiKey,
          'sessiontoken': sessionToken,
        },
      );
      return response.data;
    } catch (error) {
      return Future.error(
        'Place Loaction Error : ',
        StackTrace.fromString('This is the Trace'),
      );
    }
  }

  // origin = Current Location
  // destination = Serched For Location
  Future<dynamic> getDirections(LatLng origin, LatLng destination) async {
    try {
      Response response = await dio.get(
        directionsBaseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': googleApiKey,
        },
      );
      return response.data;
    } catch (error) {
      return Future.error(
        'Place Loaction Error : ',
        StackTrace.fromString('This is the Trace'),
      );
    }
  }
}
