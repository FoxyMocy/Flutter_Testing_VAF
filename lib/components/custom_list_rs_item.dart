part of './components.dart';

class CustomListRSItem extends StatelessWidget {
  const CustomListRSItem({super.key});

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
                border: Border.all(
              width: 1,
            )),
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
                  "Nama Rumah Sakit",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors().black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Alamat Rumah Sakit",
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
