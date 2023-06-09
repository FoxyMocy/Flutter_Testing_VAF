part of './controllers.dart';

class HospitalController extends GetxController {
  final hospitals = <Hospital>[].obs;
  final selectedCategory = ''.obs;

  void fetchHospitals() {
    hospitals.value = [
      Hospital(
          id: '1',
          name: 'Rumah Sakit Bersalin Ibu Mengandung',
          address: 'Jalan Menanjak Berbelok No. 4',
          image: 'assets/images/hospitals/3.jpg',
          category: ['Partner']),
      Hospital(
          id: '2',
          name: 'Rumah Sakit Galura Jaya',
          address: 'Jalan Galura Raya No. 53',
          image: 'assets/images/hospitals/1.jpg',
          category: ['BPJS', 'Terdekat']),
      Hospital(
          id: '3',
          name: 'Rumah Sakit Matahari',
          address: 'Jalan Mawar Selatan No. 2',
          image: 'assets/images/hospitals/5.jpg',
          category: ['BPJS', 'Partner']),
      Hospital(
          id: '4',
          name: 'Rumah Sakit Sehat Terus',
          address: 'Jalan Semar Gareng No. 179',
          image: 'assets/images/hospitals/4.jpg',
          category: ['Partner', 'Terdekat']),
      Hospital(
          id: '5',
          name: 'Rumah Sakit Jaya Abadi',
          address: 'Jalan Gandrung Utara No. 90',
          image: 'assets/images/hospitals/2.jpg',
          category: ['BPJS']),
    ];
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
  }

  List<Hospital> get filteredHospital {
    if (selectedCategory.isEmpty || selectedCategory == 'Semua') {
      return hospitals;
    } else {
      return hospitals
          .where(
              (hospital) => hospital.category.contains(selectedCategory.value))
          .toList();
    }
  }
}
