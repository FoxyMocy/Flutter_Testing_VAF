part of './pages.dart';

class ClinicPage extends StatelessWidget {
  const ClinicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Clinic Page",
          style: TextStyle(
            fontSize: 28,
            color: AppColors().black,
          ),
        ),
      ),
    );
  }
}
