part of './models.dart';

class Clinic {
  String id;
  String name;
  String address;
  String image;
  List category;

  Clinic(
      {required this.id,
      required this.name,
      required this.address,
      required this.image,
      required this.category});
}
