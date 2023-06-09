part of './components.dart';

class BannerItem extends StatelessWidget {
  String image;
  BannerItem({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 260,
      margin: EdgeInsets.only(
        left: 16,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}
