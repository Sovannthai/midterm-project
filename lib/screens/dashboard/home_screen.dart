import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_app/menu/navbar_screen.dart';
import 'package:first_app/screens/dashboard/fashion_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearchActive = false;
  TextEditingController searchController = TextEditingController();

  final List<String> imgList = [
    'assets/images/banner.jpg',
    'assets/images/banner1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('eMart'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.brown),
      ),
      drawer: const NavbarScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.5,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  enlargeFactor: 0.1,
                  enableInfiniteScroll: true,
                ),
                items: imgList
                    .map(
                      (item) => Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  buildGridItem('Cosmetic', 'assets/images/cosmetics.png'),
                  buildGridItem('Fashion', 'assets/images/fashion.png'),
                  buildGridItem('Restaurant', 'assets/images/delivery.png'),
                  buildGridItem('Car Service', 'assets/images/taxi.png'),
                  buildGridItem('Food Grocery', 'assets/images/shopping.png'),
                  buildGridItem('Parcel', 'assets/images/image.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(String title, String imagePath) {
    return SizedBox(
      width: 160,
      height: 180,
      child: Card(
        child: InkWell(
          onTap: () {
            if (title == 'Fashion') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FashionScreen()),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
