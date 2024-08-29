import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_app/menu/navbar_screen.dart';
import 'package:flutter/material.dart';

class FashionScreen extends StatefulWidget {
  const FashionScreen({super.key});

  @override
  State<FashionScreen> createState() => _FashionScreenState();
}

class _FashionScreenState extends State<FashionScreen> {
  int _selectedIndex = 0;
  bool isSearchActive = false;
  TextEditingController searchController = TextEditingController();

  List<bool> _bestSelling = List.generate(6, (_) => false);
  final List<bool> _newArrival = List.generate(6, (_) => false);
  final List<bool> _popularFavorite = List.generate(6, (_) => false);

  final List<String> imgList = [
    'assets/images/main.jpg',
    'assets/images/banner2.jpg',
  ];
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.person, 'label': 'Clothing'},
    {'icon': Icons.watch, 'label': 'Watches'},
    {'icon': Icons.phone_android, 'label': 'Phones'},
    {'icon': Icons.laptop, 'label': 'Laptops'},
    {'icon': Icons.sports_basketball, 'label': 'Sports'},
    {'icon': Icons.headphones, 'label': 'Headphones'},
    {'icon': Icons.toys, 'label': 'Toys'},
    {'icon': Icons.sports_kabaddi_sharp, 'label': 'Kids'},
  ];

  void _toggleBestSellingFavorite(int index) {
    setState(() {
      _bestSelling[index] = !_bestSelling[index];
    });
  }

  void _toggleRecommentFavorite(int index) {
    setState(() {
      _newArrival[index] = !_newArrival[index];
    });
  }

  void _togglePopularFavorite(int index) {
    setState(() {
      _popularFavorite[index] = !_popularFavorite[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_basket_sharp),
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
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),

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
                          child:
                              Image.asset(item, fit: BoxFit.cover, width: 1000),
                        ),
                      ),
                    )
                    .toList(),
              ),

              const SizedBox(height: 20),
              _buildSectionTitle('Categories', () {}),
              _buildCategorySection(),
              const SizedBox(height: 20),
              _buildSectionTitle('Popular Product', () {}),
              _newArrivalProduct(),
              const SizedBox(height: 20),
              _buildSectionTitle('Best Selling', () {}),
              _bestSellingProduct(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Show All',
            style: TextStyle(color: Colors.brown),
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection() {
    return SizedBox(
      height: 200.0,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return CategoryItem(
            icon: categories[index]['icon'],
            label: categories[index]['label'],
          );
        },
      ),
    );
  }

  Widget _bestSellingProduct() {
    return SizedBox(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              width: 180.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          'assets/images/product.jpg',
                          height: 150.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: IconButton(
                          icon: Icon(
                            _bestSelling[index]
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _toggleBestSellingFavorite(index);
                          },
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'T-shirt',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$19.00',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$110.00',
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _newArrivalProduct() {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              width: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.asset(
                      'assets/images/product.jpg',
                      height: 80.0,
                      width: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'T-shirt',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$19.00',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$110.00',
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _newArrival[index]
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _toggleRecommentFavorite(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.brown.withOpacity(0.1),
          child: Icon(icon, color: Colors.brown),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
