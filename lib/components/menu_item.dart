part of './components.dart';

class MenuItem extends StatelessWidget {
  String title;
  MenuItem({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors().blue)),
      child: Text(
        title,
        style: TextStyle(color: AppColors().black),
      ),
    );
  }
}
