import 'package:flutter/material.dart';
import 'category_pages/plumbing_category_page.dart';
import 'category_pages/cleaning_category_page.dart';
import 'category_pages/painting_category_page.dart';
import 'category_pages/electrical_category_page.dart';
import 'category_pages/carpentry_category_page.dart';
import 'category_pages/moving_category_page.dart';
import 'category_pages/roofing_category_page.dart';
import 'detail_page.dart'; // Add this import

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> filters = [
    {"name": "All", "page": null},
    {"name": "Plumbing", "page": const PlumbingCategoryPage()},
    {"name": "Cleaning", "page": const CleaningCategoryPage()},
    {"name": "Painting", "page": const PaintingCategoryPage()},
    {"name": "Electrical", "page": const ElectricalCategoryPage()},
    {"name": "Carpentry", "page": const CarpentryCategoryPage()},
    {"name": "Moving", "page": const MovingCategoryPage()},
    {"name": "Roofing", "page": const RoofingCategoryPage()},
  ];

  // List of service items (now with 7 items)
  final List<Map<String, dynamic>> serviceItems = [
    {
      "category": "Plumber",
      "title": "Expert Plumbing",
      "location": "Phnom Penh city",
      "price": "\$30.00/hr",
      "rating": "4.5",
      "reviews": "128",
      "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
    },
    {
      "category": "Cleaner",
      "title": "Sparkle Clean",
      "location": "Phnom Penh city",
      "price": "\$25.00/hr",
      "rating": "4.8",
      "reviews": "95",
      "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
    },
    {
      "category": "Painter",
      "title": "Color Master",
      "location": "Phnom Penh city",
      "price": "\$28.00/hr",
      "rating": "4.7",
      "reviews": "67",
      "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
    },
    {
      "category": "Electrician",
      "title": "Wise Electrical",
      "location": "Phnom Penh city",
      "price": "\$35.00/hr",
      "rating": "4.9",
      "reviews": "156",
      "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
    },
    {
      "category": "Carpenter",
      "title": "Wood Craft",
      "location": "Phnom Penh city",
      "price": "\$32.00/hr",
      "rating": "4.8",
      "reviews": "112",
      "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
    },
    {
      "category": "Mover",
      "title": "Fast Move",
      "location": "Phnom Penh city",
      "price": "\$40.00/hr",
      "rating": "4.6",
      "reviews": "84",
      "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
    },
    {
      "category": "Roofer",
      "title": "Top Roofing",
      "location": "Phnom Penh city",
      "price": "\$38.00/hr",
      "rating": "4.7",
      "reviews": "73",
      "image": "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
    },
  ];

  void _navigateToCategoryPage(int index) {
    if (index == 0) {
      setState(() {
        selectedIndex = index;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => filters[index]["page"],
        ),
      ).then((_) {
        setState(() {
          selectedIndex = index;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E6F86),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "All Service",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          // FILTER BUTTONS
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filters.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    _navigateToCategoryPage(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1E6F86)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      filters[index]["name"],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // CATEGORY + SEE ALL
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular Services",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    _navigateToCategoryPage(1);
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1E6F86)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // SERVICE LIST - Now with 7 items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: serviceItems.length, // Now 7 items
              itemBuilder: (context, index) {
                return _buildServiceCard(serviceItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with image and details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  service["image"],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              // DETAILS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge + Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            service["category"],
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              "${service["rating"]} (${service["reviews"]} reviews)",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service["title"],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: Colors.grey),
                        const SizedBox(width: 2),
                        Text(
                          service["location"],
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      service["price"],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 16, 
                          color: Color(0xFF1E6F86)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // BUTTONS
          Row(
            children: [
              // View profile button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage( // Changed to DetailPage
                          providerName: service["title"],
                          category: service["category"],
                          price: service["price"],
                          rating: service["rating"],
                          imageUrl: service["image"],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.remove_red_eye, size: 18, color: Color(0xFF1E6F86)),
                          SizedBox(width: 4),
                          Text(
                            "View profile",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1E6F86),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Book now button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage( // Navigate to DetailPage
                          providerName: service["title"],
                          category: service["category"],
                          price: service["price"],
                          rating: service["rating"],
                          imageUrl: service["image"],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E6F86),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            size: 18, 
                            color: Colors.white
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Book Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}