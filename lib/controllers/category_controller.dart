part of './controllers.dart';

class CategoryController extends GetxController {
  final categories = <Category>[].obs;

  void fetchCategories() {
    categories.value = [
      Category(id: '1', name: 'Semua'),
      Category(id: '2', name: 'BPJS'),
      Category(id: '3', name: 'Partner'),
      Category(id: '4', name: 'Terdekat'),
    ];
  }
}
