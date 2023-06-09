part of './models.dart';

class Hospital {
  String id;
  String name;
  String address;
  String image;
  List category;

  Hospital(
      {required this.id,
      required this.name,
      required this.address,
      required this.image,
      required this.category});
}
