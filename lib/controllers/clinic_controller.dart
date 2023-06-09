part of './controllers.dart';

class ClinicController extends GetxController {
  final clinics = <Clinic>[].obs;
  final selectedCategory = ''.obs;

  void fetchClinics() {
    clinics.value = [
      Clinic(
          id: '1',
          name: 'Klinik Sehat Sejahtera',
          address: 'Jalan Perkutut Raya No. 24 Kav 9',
          image: 'assets/images/hospitals/1.jpg',
          category: ['Terdekat']),
      Clinic(
          id: '2',
          name: 'Klinik Makmur Jaya',
          address: 'Jalan Pasir Kesik No 126',
          image: 'assets/images/hospitals/6.jpg',
          category: ['BPJS', 'Terdekat']),
      Clinic(
          id: '3',
          name: 'Klinik Ibu & Anak Sehat',
          address: 'Jalan Wilayah Selatan Raya No. 3',
          image: 'assets/images/hospitals/4.jpg',
          category: ['BPJS', 'Partner']),
      Clinic(
          id: '4',
          name: 'Klinik Sehat Abadi',
          address: 'Jalan Muntilan Barat Daya No. 21',
          image: 'assets/images/hospitals/3.jpg',
          category: ['Partner', 'Terdekat']),
      Clinic(
          id: '5',
          name: 'Klinik Terus Maju',
          address: 'Jalan Kelok 9 No. 206',
          image: 'assets/images/hospitals/2.jpg',
          category: ['Partner']),
    ];
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
  }

  List<Clinic> get filteredClinic {
    if (selectedCategory.isEmpty || selectedCategory.value == 'Semua') {
      return clinics;
    } else {
      return clinics
          .where((clinic) => clinic.category.contains(selectedCategory.value))
          .toList();
    }
  }
}
