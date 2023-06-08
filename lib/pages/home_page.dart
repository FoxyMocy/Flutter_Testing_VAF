part of './pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: ListView(
        children: <Widget>[
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                  children: [
                    MenuItem(title: 'Semua'),
                    MenuItem(title: 'BPJS'),
                    MenuItem(title: 'Partner'),
                    MenuItem(title: 'Terdekat'),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    CustomListRSItem(),
                    CustomListRSItem(),
                    CustomListRSItem(),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
