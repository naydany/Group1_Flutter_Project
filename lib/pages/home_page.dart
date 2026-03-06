import 'package:flutter/material.dart';
import 'package:maintenance_provider_service/pages/service_page.dart';
import 'package:maintenance_provider_service/pages/notification_page.dart';
import 'package:maintenance_provider_service/pages/placeholder_page.dart';
import 'package:maintenance_provider_service/pages/Ac_company.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> _pages = [const HomePageContent()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: _pages[currentIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF1E6F86),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            setState(() {
              currentIndex = 0;
            });
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ServicePage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationPage()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PlaceholderPage(title: 'Profile'),
              ),
            );
            break;
        }
      },
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        const BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_num_outlined),
          label: "Service",
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications_none),
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          label: "Notifications",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ],
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildTopBar(context),
          const SizedBox(height: 15),
          _buildBanner(context),
          const SizedBox(height: 20),
          Expanded(child: _buildGridSection(context)),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF1E6F86),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ServicePage()),
                );
              },
              child: Container(
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Search", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PlaceholderPage(title: 'Profile'),
                ),
              );
            },
            child: const Icon(Icons.person_outline, color: Colors.white),
          ),
        ],
      ),
    );
  }

  /// slide banner
  Widget _buildBanner(BuildContext context) {
    final List<String> bannerImages = [
      "assets/Images/appliance.jpg",
      "assets/Images/pest_control.webp",
      "assets/Images/cleaning.jpeg",
    ];

    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: bannerImages.length,
        controller: PageController(viewportFraction: 0.9),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ServicePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      bannerImages[index],
                    ), // Changed to AssetImage
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridSection(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        "title": "AC Repair",
        "image":
            "assets/Images/images (6).jpeg", // Fixed typo from eletric to electric
        "route": const MyApp(),
      },
      {
        "title": "Plumbing",
        "image": "assets/Images/plumbing.jpeg", // Use specific image
        "route": const ServicePage(),
      },
      {
        "title": "Cleaning",
        "image": "assets/Images/cleaning.jpeg", // Use specific image
        "route": const ServicePage(),
      },
      {
        "title": "Painting",
        "image": "assets/Images/painting.jpeg", // Use specific image
        "route": const ServicePage(),
      },
      {
        "title": "Electrician",
        "image": "assets/Images/eletric.jpeg", // Use specific image
        "route": const ServicePage(),
      },
      {
        "title": "Carpenter",
        "image": "assets/Images/carpenter.webp", // Use specific image
        "route": const ServicePage(),
      },
      {
        "title": "Appliance",
        "image": "assets/Images/appliance.jpg", // Use specific image
        "route": const ServicePage(),
      },
      {
        "title": "Pest Control",
        "image":
            "assets/Images/pest_control.webp", // Use specific image (renamed from "pest control.webp")
        "route": const ServicePage(),
      },
      {
        "title": "More",
        "image": "assets/Images/more.webp", // Use specific image
        "route": const ServicePage(),
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ServicePage()),
                  );
                },
                child: const Text(
                  "See all",
                  style: TextStyle(
                    color: Color(0xFF1E6F86),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => categories[index]["route"],
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            categories[index]["image"],
                            width: double.infinity,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print(
                                'Error loading image: ${categories[index]["image"]} - $error',
                              );
                              return Container(
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        categories[index]["title"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
