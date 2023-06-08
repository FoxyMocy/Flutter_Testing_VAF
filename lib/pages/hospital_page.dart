part of './pages.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "RS Page",
          style: TextStyle(
            fontSize: 28,
            color: AppColors().black,
          ),
        ),
      ),
    );
  }
}
