part of './pages.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset(AppImages().vafIcon),
          title: Text(
            'Valbury',
            style: TextStyle(
              color: AppColors().black,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_rounded,
                color: AppColors().blue,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Home',
              ),
              Tab(
                text: 'Dashboard',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [HomeView(), DashboardView()],
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HospitalController hospitalController = Get.put(HospitalController());
  final ClinicController clinicController = Get.put(ClinicController());
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    hospitalController.fetchHospitals();
    clinicController.fetchClinics();
    categoryController.fetchCategories();
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        // RUMAH SAKIT SECTION
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rumah Sakit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    child: Text(
                      'Lihat Semua',
                      style: TextStyle(color: AppColors().lightBlue),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryController.categories
                    .map((category) => Obx(() => CategotyItem(
                        text: category.name,
                        onPressed: () {
                          hospitalController.filterByCategory(category.name);
                        },
                        isSelected: hospitalController.selectedCategory.value ==
                            category.name)))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Obx(() {
                  final filteredHopitals = hospitalController.filteredHospital;
                  if (filteredHopitals.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: filteredHopitals
                          .map((hospital) => CustomListRSItem(
                                name: hospital.name,
                                address: hospital.address,
                                image: hospital.image,
                              ))
                          .take(3)
                          .toList(),
                    );
                  }
                }))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              BannerItem(image: AppImages().banner),
              BannerItem(image: AppImages().banner),
              BannerItem(image: AppImages().banner)
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Clinic SECTION
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Klinik',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    child: Text(
                      'Lihat Semua',
                      style: TextStyle(color: AppColors().lightBlue),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryController.categories
                    .map((category) => Obx(() => CategotyItem(
                        text: category.name,
                        onPressed: () {
                          clinicController.filterByCategory(category.name);
                        },
                        isSelected: clinicController.selectedCategory.value ==
                            category.name)))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Obx(() {
                  final filteredHopitals = clinicController.filteredClinic;
                  if (filteredHopitals.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: filteredHopitals
                          .map((hospital) => CustomListRSItem(
                                name: hospital.name,
                                address: hospital.address,
                                image: hospital.image,
                              ))
                          .take(3)
                          .toList(),
                    );
                  }
                }))
          ],
        ),
      ],
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dashboard View Page'),
    );
  }
}
