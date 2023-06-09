part of './components.dart';

class CategotyItem extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool isSelected;

  const CategotyItem(
      {required this.text,
      required this.onPressed,
      required this.isSelected,
      super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return ElevatedButton(
  //     onPressed: onPressed,
  //     style: ButtonStyle(
  //       backgroundColor:
  //           isSelected ? MaterialStateProperty.all<Color>(Colors.blue) : null,
  //     ),
  //     child: Text(text),
  //   );
  // }
  // String title;
  // CategotyItem({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        margin: EdgeInsets.only(
          left: 16,
        ),
        decoration: BoxDecoration(
            color: isSelected ? AppColors().lightBlue : AppColors().white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1,
                color: isSelected ? Colors.transparent : AppColors().blue)),
        child: Text(
          text,
          style: TextStyle(
              color: isSelected ? AppColors().white : AppColors().black,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400),
        ),
      ),
    );
  }
}
