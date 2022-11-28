// paths to collections and documents in firestore
import 'package:patriots_parking/resources/firebase/auth_methods.dart';
import 'package:patriots_parking/resources/locator.dart';

class FirestorePath {
  static String parkingLots() => 'parkingLots';
  static String parkingLot(String id) => 'parkingLots/$id';

  static String parkingSpaces() => 'spaces';
  static String parkingSpace(String id) => 'spaces/$id';

  static String statisticalData() => 'StatisticalDatanull';
  static String statisticalData_(String id) => 'StatisticalDatanull/$id';

  static String users() => 'users';
  static String userData() => 'users/${locator.get<AuthMethods>().uid}';
}
