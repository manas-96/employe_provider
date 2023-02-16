import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';



class AddressLogic extends GetxController{
  var loader = false.obs;
  Future<Position>getLatLong()async{
    loader.value=true;
    LocationPermission permission=await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    loader.value=false;
    return position;
  }
  addressToLatLong(String address)async{
    List<Location> locations = await locationFromAddress(address);
    print(locations.first);
  }
}