part of './components.dart';

class CustomListRSItem extends StatelessWidget {
  String name, address, image;
  CustomListRSItem(
      {required this.name,
      required this.address,
      required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors().black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  address,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors().grey,
                  ),
                ),
              ],
            ),
          )),
          GestureDetector(
            onTap: () {},
            child: Text(
              'lihat detail',
              style: TextStyle(
                color: AppColors().lightBlue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
