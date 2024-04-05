// // import 'dart:async';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:get/get.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:sunrise_app/view/sunrise_sunset_screen/sunrise_sunset_screen.dart';
// //
// // class GoogleController extends GetxController {
// //
// //   final Completer<GoogleMapController> _controller = Completer();
// //
// //   final Set<Marker> markers = {};
// //    LatLng? lastMapPosition;
// //
// //   MapType currentMapType = MapType.hybrid;
// //   String address = '';
// //
// //   bool isLoad = false;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     // _getLocation();
// //   }
// //
// //   // _getLocation() async {
// //   //   try {
// //   //     isLoad = true;
// //   //     Position currentPosition = await Geolocator.getCurrentPosition(
// //   //         desiredAccuracy: LocationAccuracy.low,
// //   //         forceAndroidLocationManager: false
// //   //     //  desiredAccuracy: L   );
// //   //     print('==========>$currentPosition');
// //   //     lastMapPosition = LatLng(
// //   //       currentPosition.latitude,
// //   //       currentPosition.longitude,
// //   //     );
// //   //     onAddMarkerButtonPressed(lastMapPosition!);
// //   //     print('==========>$isLoad');
// //   //     isLoad = false;
// //   //   } catch (e) {
// //   //     print("Error getting current location: $e");
// //   //   }
// //   // }
// //
// //   onAddMarkerButtonPressed(LatLng latLng) async {
// //     markers.add(
// //       Marker(
// //         markerId: MarkerId(latLng.toString()),
// //         position: latLng,
// //         icon: BitmapDescriptor.defaultMarker,
// //         onTap: () {
// //           onMarkerTapped(latLng);
// //         },
// //       ),
// //     );
// //
// //     List<Placemark> placeMarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
// //
// //     String street = placeMarks[0].street ?? '';
// //     String subLocality = placeMarks[0].subLocality ?? '';
// //     String locality = placeMarks[0].locality ?? '';
// //     String administrativeArea = placeMarks[0].administrativeArea ?? '';
// //     String postalCode = placeMarks[0].postalCode ?? '';
// //     String country = placeMarks[0].country ?? '';
// //
// //     List<String> addressComponents = [
// //       street,
// //       subLocality,
// //       locality,
// //       administrativeArea,
// //       postalCode,
// //       country
// //     ];
// //
// //     address = addressComponents.where((element) => element.isNotEmpty).join(', ');
// //
// //     markers.clear();
// //     update();
// //   }
// //
// //   onCameraMove(CameraPosition position) {
// //     lastMapPosition = position.target;
// //   }
// //
// //   onMapCreated(GoogleMapController controller) {
// //     _controller.complete(controller);
// //   }
// //
// //   onMarkerTapped(LatLng latLng) {
// //     onAddMarkerButtonPressed(latLng);
// //   }
// //
// //   void onLocationData() {
// //     Get.to(
// //       SunriseSunetScreen(
// //         latitude: lastMapPosition!.latitude,
// //         longitude: lastMapPosition!.longitude,
// //         address: address,
// //       ),
// //     );
// //   }
// // }
//
// import 'dart:async';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:sunrise_app/view/sunrise_sunset_screen/sunrise_sunset_screen.dart';
//
// class GoogleController extends GetxController {
//
//   final Completer<GoogleMapController> _controller = Completer();
//
//   final Set<Marker> markers = {};
//    LatLng? lastMapPosition;
//
//   MapType currentMapType = MapType.hybrid;
//   String address = '';
//   bool isLoad = false;
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     _getLocation();
//   }
//   _getLocation() async {
//     try {
//       isLoad = true;
//       LocationPermission permission = await Geolocator.requestPermission();
//
//       if (permission == LocationPermission.always || permission == LocationPermission.whileInUse){
//         Position currentPosition = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best,
//         );
//        lastMapPosition = LatLng(
//           currentPosition.latitude,
//           currentPosition.longitude,
//         );
//        onAddMarkerButtonPressed(lastMapPosition!);
//         isLoad = false;
//       }else{
//         print("User denied location permission");
//       }
//     } catch (e) {
//       print("Error getting current location: $e");
//     }
//   }
//
//
//
//   onAddMarkerButtonPressed(LatLng latLng) async {
//     markers.add(
//       Marker(
//         markerId: MarkerId(latLng.toString()),
//         position: latLng,
//         icon: BitmapDescriptor.defaultMarker,
//         onTap: () {
//           onMarkerTapped(latLng);
//         },
//       ),
//     );
//
//     List<Placemark> placeMarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
//
//     String street = placeMarks[0].street ?? '';
//     String subLocality = placeMarks[0].subLocality ?? '';
//     String locality = placeMarks[0].locality ?? '';
//     String administrativeArea = placeMarks[0].administrativeArea ?? '';
//     String postalCode = placeMarks[0].postalCode ?? '';
//     String country = placeMarks[0].country ?? '';
//
//     List<String> addressComponents = [
//       street,
//       subLocality,
//       locality,
//       administrativeArea,
//       postalCode,
//       country
//     ];
//
//     address = addressComponents.where((element) => element.isNotEmpty).join(', ');
//
//     markers.clear();
//     update();
//   }
//
//   onCameraMove(CameraPosition position) {
//     lastMapPosition = position.target;
//   }
//
//   onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }
//
//   onMarkerTapped(LatLng latLng) {
//     onAddMarkerButtonPressed(latLng);
//   }
//
//   void onLocationData() {
//     Get.to(
//       SunriseSunetScreen(
//         latitude: lastMapPosition?.latitude,
//         longitude: lastMapPosition?.longitude,
//         address: address,
//       ),
//     );
//   }
// }
// // lat :- 21.700367305080523 lon :- 73.0005944520235

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sunrise_app/services/prefServices.dart';
import 'package:sunrise_app/view/sunrise_sunset_screen/sunrise_sunset_screen.dart';

class GoogleController extends GetxController {

  final TextEditingController searchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? mapController;

  //final Set<Marker> markers = {};
  final RxSet<Marker> markers = <Marker>{}.obs;
  Rx<LatLng?> lastMapPosition =  Rx<LatLng?>(null);

 // LatLng? lastMapPosition;

  //MapType currentMapType = MapType.hybrid;
  Rx<MapType> currentMapType = MapType.hybrid.obs;
  //String address = '';
  RxString address = ''.obs;
  RxString searchAddress = ''.obs;
  RxBool isLoad = false.obs;

  RxList<String> searchResultAddresses = <String>[].obs;
  RxList<double> searchResultLatitudes = <double>[].obs;
  RxList<double> searchResultLongitudes = <double>[].obs;

 // List locationList = [];
//  RxString lastAddress = ''.obs;

  RxList<String> locationList = <String>[].obs;
  RxList<String> suggestions = <String>[].obs;




  @override
  Future<void> onInit() async {
    super.onInit();
    _getCurrentLocation();
    address.value = PrefServices.getString('lastAddress');
    locationList.value = PrefServices.getStringList('locationList');
  }

  _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
        Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
        lastMapPosition.value = LatLng(
          currentPosition.latitude,
          currentPosition.longitude,
        );
        moveCameraToLocation(lastMapPosition.value!);
        onAddMarkerButtonPressed(lastMapPosition.value!);
      } else {
        print("User denied location permission");
      }
    } catch (e) {
      print("Error getting current location: $e");
    }
  }

  Future<String> onAddMarkerButtonPressed(LatLng latLng) async {
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {
          onMarkerTapped(latLng);
        },
      ),
    );
    moveCameraToLocation(latLng);
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      String street = placeMarks.isNotEmpty ? placeMarks[0].street ?? '' : '';
      String subLocality = placeMarks.isNotEmpty ? placeMarks[0].subLocality ?? '' : '';
      String locality = placeMarks.isNotEmpty ? placeMarks[0].locality ?? '' : '';
      String administrativeArea = placeMarks.isNotEmpty ? placeMarks[0].administrativeArea ?? '' : '';
      String postalCode = placeMarks.isNotEmpty ? placeMarks[0].postalCode ?? '' : '';
      String country = placeMarks.isNotEmpty ? placeMarks[0].country ?? '' : '';

      List<String> addressComponents = [
        street,
        subLocality,
        locality,
        administrativeArea,
        postalCode,
        country,
      ];
      address.value = addressComponents.where((element) => element.isNotEmpty).join(', ');
      address.value = address.value;
      lastMapPosition.value = LatLng(
        latLng.latitude,
        latLng.longitude,
      );
      address.value = address.value;
      update();
      return address.value;

    } catch (e) {
      print("Error getting placemark: $e");
      return address.value;
    }
  }

  onCameraMove(CameraPosition position) {
    lastMapPosition.value = position.target;
  }

  onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    mapController = controller;
  }

    onMarkerTapped(LatLng latLng) {
    onAddMarkerButtonPressed(latLng);
  }

  Future<String> searchLocations(String query) async {
    try {
      List<Location> locations = await locationFromAddress(query);

      suggestions.clear();

      searchResultAddresses.clear();
      searchResultLatitudes.clear();
      searchResultLongitudes.clear();

      markers.clear();

      for (var location in locations) {
        List<Placemark> placeMarks = await placemarkFromCoordinates(location.latitude, location.longitude);

        String street = placeMarks.isNotEmpty ? placeMarks[0].street ?? '' : '';
        String subLocality = placeMarks.isNotEmpty ? placeMarks[0].subLocality ?? '' : '';
        String locality = placeMarks.isNotEmpty ? placeMarks[0].locality ?? '' : '';
        String administrativeArea = placeMarks.isNotEmpty ? placeMarks[0].administrativeArea ?? '' : '';
        String postalCode = placeMarks.isNotEmpty ? placeMarks[0].postalCode ?? '' : '';
        String country = placeMarks.isNotEmpty ? placeMarks[0].country ?? '' : '';

        List<String> addressComponents = [
          street,
          subLocality,
          locality,
          administrativeArea,
          postalCode,
          country,
        ];

        searchAddress.value = addressComponents.where((element) => element.isNotEmpty).join(', ');
        address.value = searchAddress.value;

        searchResultAddresses.add(searchAddress.value);
        searchResultLatitudes.add(location.latitude);
        searchResultLongitudes.add(location.longitude);

        moveCameraToLocation(LatLng(location.latitude, location.longitude));
        markers.add(
          Marker(
            markerId: MarkerId(location.toString()),
            position: LatLng(location.latitude, location.longitude),
            icon: BitmapDescriptor.defaultMarker,
            onTap: () {
              onMarkerTapped(LatLng(location.latitude, location.longitude));
            },
          ),
        );
        lastMapPosition.value = LatLng(
          location.latitude,
          location.longitude,
        );
        address.value = searchAddress.value;
        suggestions.add(searchAddress.value);
      }
      update();
      return searchAddress.value;
    } catch (e) {
      print("Error searching locations: $e");
      return searchAddress.value;
    }
  }

  Future<void> onSearch(String query) async {
    try {
      await searchLocations(query);
      suggestions.addAll(searchResultAddresses);
    } catch (e) {
      print("Error searching locations: $e");
    }
  }

  void onSuggestionSelected(String suggestion) {
    searchController.text = suggestion;
    searchResultAddresses.clear();
    searchResultLatitudes.clear();
    searchResultLongitudes.clear();
    suggestions.clear();
  }

  moveCameraToLocation(LatLng location) async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newLatLngZoom(location, 12.0),
    );
  }

  void clearLocationList() async {
   locationList.clear();
    await PrefServices.setValue("locationList",locationList);
    print("===========$locationList");
    update();
  }

  toggleMapType() {
    if (currentMapType.value == MapType.hybrid) {
      currentMapType.value = MapType.normal;
      print("MapType===Satellite=========");
    } else {
      currentMapType.value = MapType.hybrid;
      print("MapType===hybrid=========");
    }
    update();
  }

  Future<String> loadJsonFromAsset(String assetPath) async {
    return await rootBundle.loadString(assetPath);
  }

  onLocationData(String addr, double lati, double long) async {
    address = addr.obs;
    print("=======>$address");
    locationList.add(address.value);
    await PrefServices.setValue('locationList', locationList);
    Get.offAll(
      SunriseSunetScreen(
        latitude: lati,
        longitude: long,
        address: address.value,
        value: false,
      ),
    );
  }
}

// lati :- 21.199353252090717  lon :- 72.8343528136611
// lati:- 21.2393602  lon :- 72.8801493
// lati:-16.0836997307694  lon:-100.3837738931179
