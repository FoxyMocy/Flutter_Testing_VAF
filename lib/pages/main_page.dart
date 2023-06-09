part of './pages.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final BottomNavigationController _bottomNavigationController =
      Get.put(BottomNavigationController());

  final List<Widget> _screens = [
    HomePage(),
    const HospitalPage(),
    const ClinicPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _screens[_bottomNavigationController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors().white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _bottomNavigationController.currentIndex.value,
          onTap: _bottomNavigationController.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_rounded),
              label: 'RS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_rounded),
              label: 'Klinik',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
