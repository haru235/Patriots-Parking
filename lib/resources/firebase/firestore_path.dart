// paths to collections and documents in firestore
class FirestorePath {
  static String parkingLots() => 'parkingLots';
  static String parkingLot(String id) => 'parkingLots/$id';

  static String parkingSpaces() => 'spaces';
  static String parkingSpace(String id) => 'spaces/$id';
  
  static String StatisticalData() => 'StatisticalDatanull';
  static String StatisticalData_(String id) => 'StatisticalDatanull/$id';
}
