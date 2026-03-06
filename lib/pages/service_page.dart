import 'package:flutter/material.dart';
import 'detail_page.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  int selectedIndex = 0;

  // Filter states
  RangeValues _priceRange = const RangeValues(20, 80);
  double _ratingFilter = 4.0;
  String _sortBy = 'recommended';
  String _distanceFilter = '5 km';

  final List<Map<String, String>> filters = [
    {"name": "All"},
    {"name": "Plumbing"},
    {"name": "Cleaning"},
    {"name": "Painting"},
    {"name": "Electrical"},
    {"name": "Carpentry"},
    {"name": "Moving"},
    {"name": "Roofing"},
  ];

  final List<String> distanceOptions = [
    '1 km',
    '3 km',
    '5 km',
    '10 km',
    '15+ km',
  ];
  final List<String> sortOptions = [
    'recommended',
    'rating',
    'price low to high',
    'price high to low',
  ];

  // //////////////////////////////////////////////
  // START OF CHANGES - Expanded serviceItems with more items per category
  // Now each category has 5 items for Plumbing, 3 items for others
  // //////////////////////////////////////////////
  final List<Map<String, dynamic>> serviceItems = [
    // ========== PLUMBING ITEMS (5 items) ==========
    {
      "category": "Plumber",
      "title": "Expert Plumbing",
      "location": "Phnom Penh city",
      "price": "\$30.00/hr",
      "rating": "4.5",
      "reviews": "128",
      "image": "assets/Images/plumbing.jpeg",
      "distance": "2.5 km",
      "availability": "Available now",
      "priceRange": "\$30-45/hr",
      "priceValue": 30.0,
    },
    {
      "category": "Plumber",
      "title": "24/7 Emergency Plumbing",
      "location": "Phnom Penh city",
      "price": "\$35.00/hr",
      "rating": "4.7",
      "reviews": "89",
      "image": "assets/Images/plumbing.jpeg",
      "distance": "3.1 km",
      "availability": "24/7 Available",
      "priceRange": "\$35-50/hr",
      "priceValue": 35.0,
    },
    {
      "category": "Plumber",
      "title": "Pipe Masters",
      "location": "Phnom Penh city",
      "price": "\$28.00/hr",
      "rating": "4.4",
      "reviews": "56",
      "image": "assets/Images/plumbing.jpeg",
      "distance": "1.9 km",
      "availability": "Available now",
      "priceRange": "\$28-40/hr",
      "priceValue": 28.0,
    },
    {
      "category": "Plumber",
      "title": "Drain Cleaning Pro",
      "location": "Phnom Penh city",
      "price": "\$32.00/hr",
      "rating": "4.8",
      "reviews": "112",
      "image": "assets/Images/carpenter.webp",
      "distance": "2.2 km",
      "availability": "Available now",
      "priceRange": "\$30-45/hr",
      "priceValue": 32.0,
    },
    {
      "category": "Plumber",
      "title": "Water Heater Specialist",
      "location": "Phnom Penh city",
      "price": "\$38.00/hr",
      "rating": "4.6",
      "reviews": "67",
      "image": "assets/Images/plumbing.jpeg",
      "distance": "4.0 km",
      "availability": "Available tomorrow",
      "priceRange": "\$35-50/hr",
      "priceValue": 38.0,
    },

    // ========== CLEANING ITEMS (3 items) ==========
    {
      "category": "Cleaner",
      "title": "Sparkle Clean",
      "location": "Phnom Penh city",
      "price": "\$25.00/hr",
      "rating": "4.8",
      "reviews": "95",
      "image": "assets/Images/cleaning.jpeg",
      "distance": "1.8 km",
      "availability": "Available now",
      "priceRange": "\$20-30/hr",
      "priceValue": 25.0,
    },
    {
      "category": "Cleaner",
      "title": "Deep Clean Pro",
      "location": "Phnom Penh city",
      "price": "\$32.00/hr",
      "rating": "4.9",
      "reviews": "112",
      "image": "assets/Images/cleaning.jpeg",
      "distance": "2.2 km",
      "availability": "Available tomorrow",
      "priceRange": "\$30-45/hr",
      "priceValue": 32.0,
    },
    {
      "category": "Cleaner",
      "title": "Eco-Friendly Cleaning",
      "location": "Phnom Penh city",
      "price": "\$28.00/hr",
      "rating": "4.6",
      "reviews": "67",
      "image": "assets/Images/cleaning.jpeg",
      "distance": "3.5 km",
      "availability": "Available now",
      "priceRange": "\$25-38/hr",
      "priceValue": 28.0,
    },

    // ========== PAINTING ITEMS (3 items) ==========
    {
      "category": "Painter",
      "title": "Color Master",
      "location": "Phnom Penh city",
      "price": "\$28.00/hr",
      "rating": "4.7",
      "reviews": "67",
      "image": "assets/Images/painting.jpeg",
      "distance": "3.2 km",
      "availability": "Available tomorrow",
      "priceRange": "\$25-40/hr",
      "priceValue": 28.0,
    },
    {
      "category": "Painter",
      "title": "Precision Painting",
      "location": "Phnom Penh city",
      "price": "\$33.00/hr",
      "rating": "4.8",
      "reviews": "78",
      "image": "assets/Images/painting.jpeg",
      "distance": "2.8 km",
      "availability": "Available now",
      "priceRange": "\$30-45/hr",
      "priceValue": 33.0,
    },
    {
      "category": "Painter",
      "title": "Artistic Interiors",
      "location": "Phnom Penh city",
      "price": "\$30.00/hr",
      "rating": "4.5",
      "reviews": "45",
      "image": "assets/Images/painting.jpeg",
      "distance": "4.0 km",
      "availability": "Available now",
      "priceRange": "\$28-42/hr",
      "priceValue": 30.0,
    },

    // ========== ELECTRICAL ITEMS (3 items) ==========
    {
      "category": "Electrician",
      "title": "Wise Electrical",
      "location": "Phnom Penh city",
      "price": "\$35.00/hr",
      "rating": "4.9",
      "reviews": "156",
      "image": "assets/Images/eletric.jpeg",
      "distance": "1.5 km",
      "availability": "Available now",
      "priceRange": "\$35-50/hr",
      "priceValue": 35.0,
    },
    {
      "category": "Electrician",
      "title": "Power Solutions",
      "location": "Phnom Penh city",
      "price": "\$32.00/hr",
      "rating": "4.7",
      "reviews": "89",
      "image": "assets/Images/eletric.jpeg",
      "distance": "2.3 km",
      "availability": "Available now",
      "priceRange": "\$30-45/hr",
      "priceValue": 32.0,
    },
    {
      "category": "Electrician",
      "title": "Emergency Electric",
      "location": "Phnom Penh city",
      "price": "\$40.00/hr",
      "rating": "4.8",
      "reviews": "67",
      "image": "assets/Images/eletric.jpeg",
      "distance": "3.7 km",
      "availability": "24/7 Available",
      "priceRange": "\$38-55/hr",
      "priceValue": 40.0,
    },

    // ========== CARPENTRY ITEMS (3 items) ==========
    {
      "category": "Carpenter",
      "title": "Wood Craft",
      "location": "Phnom Penh city",
      "price": "\$32.00/hr",
      "rating": "4.8",
      "reviews": "112",
      "image": "assets/Images/carpenter.webp",
      "distance": "4.0 km",
      "availability": "Available now",
      "priceRange": "\$28-42/hr",
      "priceValue": 32.0,
    },
    {
      "category": "Carpenter",
      "title": "Custom Furniture",
      "location": "Phnom Penh city",
      "price": "\$38.00/hr",
      "rating": "4.9",
      "reviews": "94",
      "image": "assets/Images/carpenter.webp",
      "distance": "2.7 km",
      "availability": "Available tomorrow",
      "priceRange": "\$35-50/hr",
      "priceValue": 38.0,
    },
    {
      "category": "Carpenter",
      "title": "Repair & Restore",
      "location": "Phnom Penh city",
      "price": "\$29.00/hr",
      "rating": "4.6",
      "reviews": "56",
      "image": "assets/Images/carpenter.webp",
      "distance": "3.3 km",
      "availability": "Available now",
      "priceRange": "\$25-38/hr",
      "priceValue": 29.0,
    },

    // ========== MOVING ITEMS (3 items) ==========
    {
      "category": "Mover",
      "title": "Fast Move",
      "location": "Phnom Penh city",
      "price": "\$40.00/hr",
      "rating": "4.6",
      "reviews": "84",
      "image": "assets/Images/more.webp",
      "distance": "5.0 km",
      "availability": "Available now",
      "priceRange": "\$35-55/hr",
      "priceValue": 40.0,
    },
    {
      "category": "Mover",
      "title": "Safe Transport",
      "location": "Phnom Penh city",
      "price": "\$45.00/hr",
      "rating": "4.8",
      "reviews": "112",
      "image": "assets/Images/more.webp",
      "distance": "4.2 km",
      "availability": "Available now",
      "priceRange": "\$40-60/hr",
      "priceValue": 45.0,
    },
    {
      "category": "Mover",
      "title": "Moving Masters",
      "location": "Phnom Penh city",
      "price": "\$38.00/hr",
      "rating": "4.5",
      "reviews": "67",
      "image": "assets/Images/more.webp",
      "distance": "3.8 km",
      "availability": "Available tomorrow",
      "priceRange": "\$35-50/hr",
      "priceValue": 38.0,
    },

    // ========== ROOFING ITEMS (3 items) ==========
    {
      "category": "Roofer",
      "title": "Top Roofing",
      "location": "Phnom Penh city",
      "price": "\$38.00/hr",
      "rating": "4.7",
      "reviews": "73",
      "image": "assets/Images/more.webp",
      "distance": "6.2 km",
      "availability": "Available tomorrow",
      "priceRange": "\$35-50/hr",
      "priceValue": 38.0,
    },
    {
      "category": "Roofer",
      "title": "Roof Experts",
      "location": "Phnom Penh city",
      "price": "\$42.00/hr",
      "rating": "4.8",
      "reviews": "89",
      "image": "assets/Images/more.webp",
      "distance": "5.5 km",
      "availability": "Available now",
      "priceRange": "\$40-55/hr",
      "priceValue": 42.0,
    },
    {
      "category": "Roofer",
      "title": "Quick Roof Repair",
      "location": "Phnom Penh city",
      "price": "\$35.00/hr",
      "rating": "4.5",
      "reviews": "45",
      "image": "assets/Images/more.webp",
      "distance": "4.8 km",
      "availability": "Available now",
      "priceRange": "\$32-48/hr",
      "priceValue": 35.0,
    },
  ];
  // //////////////////////////////////////////////
  // END OF CHANGES - Total items: 23 (5 Plumbing + 18 others)
  // //////////////////////////////////////////////

  // Get filtered services based on selected category and filters
  List<Map<String, dynamic>> get filteredServices {
    // First filter by category
    List<Map<String, dynamic>> results;

    if (selectedIndex == 0) {
      results = List.from(serviceItems);
    } else {
      String selectedFilter = filters[selectedIndex]["name"]!.toLowerCase();
      results = serviceItems.where((service) {
        String category = service["category"].toString().toLowerCase();
        if (selectedFilter == "plumbing") return category == "plumber";
        if (selectedFilter == "cleaning") return category == "cleaner";
        if (selectedFilter == "painting") return category == "painter";
        if (selectedFilter == "electrical") return category == "electrician";
        if (selectedFilter == "carpentry") return category == "carpenter";
        if (selectedFilter == "moving") return category == "mover";
        if (selectedFilter == "roofing") return category == "roofer";
        return false;
      }).toList();
    }

    // Then apply filters
    results = results.where((service) {
      // Price range filter
      double price = service["priceValue"] ?? 0;
      if (price < _priceRange.start || price > _priceRange.end) {
        return false;
      }

      // Rating filter
      double rating = double.parse(service["rating"]);
      if (rating < _ratingFilter) {
        return false;
      }

      // Distance filter
      String distanceStr = service["distance"] ?? "5 km";
      double distance = double.parse(distanceStr.replaceAll(' km', ''));
      double maxDistance = double.parse(
        _distanceFilter.replaceAll(' km', '').replaceAll('+', ''),
      );
      if (distance > maxDistance) {
        return false;
      }

      return true;
    }).toList();

    // Apply sorting
    switch (_sortBy) {
      case 'rating':
        results.sort(
          (a, b) =>
              double.parse(b["rating"]).compareTo(double.parse(a["rating"])),
        );
        break;
      case 'price low to high':
        results.sort(
          (a, b) => (a["priceValue"] ?? 0).compareTo(b["priceValue"] ?? 0),
        );
        break;
      case 'price high to low':
        results.sort(
          (a, b) => (b["priceValue"] ?? 0).compareTo(a["priceValue"] ?? 0),
        );
        break;
      default:
        // recommended - keep as is or sort by rating
        results.sort(
          (a, b) =>
              double.parse(b["rating"]).compareTo(double.parse(a["rating"])),
        );
    }

    return results;
  }

  String get appBarTitle {
    if (selectedIndex == 0) return "All Services";
    return "${filters[selectedIndex]["name"]} Services";
  }

  int get activeFilterCount {
    int count = 0;
    if (_priceRange.start > 20 || _priceRange.end < 80) count++;
    if (_ratingFilter > 4.0) count++;
    if (_distanceFilter != '5 km') count++;
    if (_sortBy != 'recommended') count++;
    return count;
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Filters",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _priceRange = const RangeValues(20, 80);
                            _ratingFilter = 4.0;
                            _distanceFilter = '5 km';
                            _sortBy = 'recommended';
                          });
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(color: Color(0xFF1E6F86)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E6F86),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Apply"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Filter Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Sort By
                  const Text(
                    "Sort By",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: sortOptions.map((option) {
                      bool isSelected = _sortBy == option;
                      return FilterChip(
                        label: Text(option),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _sortBy = option;
                          });
                        },
                        backgroundColor: Colors.grey[100],
                        selectedColor: const Color(0xFF1E6F86).withOpacity(0.2),
                        checkmarkColor: const Color(0xFF1E6F86),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? const Color(0xFF1E6F86)
                              : Colors.black,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Price Range
                  const Text(
                    "Price Range",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${_priceRange.start.toStringAsFixed(0)}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${_priceRange.end.toStringAsFixed(0)}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  RangeSlider(
                    values: _priceRange,
                    min: 20,
                    max: 80,
                    divisions: 12,
                    activeColor: const Color(0xFF1E6F86),
                    inactiveColor: Colors.grey[300],
                    labels: RangeLabels(
                      "\$${_priceRange.start.toStringAsFixed(0)}",
                      "\$${_priceRange.end.toStringAsFixed(0)}",
                    ),
                    onChanged: (values) {
                      setState(() {
                        _priceRange = values;
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  // Rating Filter
                  const Text(
                    "Minimum Rating",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: _ratingFilter,
                          min: 3.0,
                          max: 5.0,
                          divisions: 4,
                          activeColor: const Color(0xFF1E6F86),
                          inactiveColor: Colors.grey[300],
                          label: "${_ratingFilter.toStringAsFixed(1)} ★",
                          onChanged: (value) {
                            setState(() {
                              _ratingFilter = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E6F86).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _ratingFilter.toStringAsFixed(1),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Distance Filter
                  const Text(
                    "Maximum Distance",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: distanceOptions.map((distance) {
                      bool isSelected = _distanceFilter == distance;
                      return FilterChip(
                        label: Text(distance),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _distanceFilter = distance;
                          });
                        },
                        backgroundColor: Colors.grey[100],
                        selectedColor: const Color(0xFF1E6F86).withOpacity(0.2),
                        checkmarkColor: const Color(0xFF1E6F86),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? const Color(0xFF1E6F86)
                              : Colors.black,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  void _removeFilter(String filterType) {
    setState(() {
      switch (filterType) {
        case 'price':
          _priceRange = const RangeValues(20, 80);
          break;
        case 'rating':
          _ratingFilter = 4.0;
          break;
        case 'distance':
          _distanceFilter = '5 km';
          break;
        case 'sort':
          _sortBy = 'recommended';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E6F86),
        elevation: 0,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context),
        // ),
        centerTitle: true,
        title: Text(
          appBarTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: _showFilterSheet,
              ),
              if (activeFilterCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      activeFilterCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
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
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1E6F86)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      filters[index]["name"]!,
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

          // Active filters display
          if (activeFilterCount > 0)
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 10, left: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  if (_priceRange.start > 20 || _priceRange.end < 80)
                    _buildActiveFilterChip(
                      "Price: \$${_priceRange.start.toStringAsFixed(0)}-\$${_priceRange.end.toStringAsFixed(0)}",
                      'price',
                    ),
                  if (_ratingFilter > 4.0)
                    _buildActiveFilterChip(
                      "${_ratingFilter.toStringAsFixed(1)}+ ★",
                      'rating',
                    ),
                  if (_distanceFilter != '5 km')
                    _buildActiveFilterChip(
                      "Within $_distanceFilter",
                      'distance',
                    ),
                  if (_sortBy != 'recommended')
                    _buildActiveFilterChip("Sort: $_sortBy", 'sort'),
                ],
              ),
            ),

          const SizedBox(height: 20),

          // Results count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${filteredServices.length} services found",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                if (selectedIndex == 0)
                  GestureDetector(
                    onTap: () {
                      // Show all services or navigate to first category
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E6F86),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // SERVICE LIST
          Expanded(
            child: filteredServices.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No services found",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Try adjusting your filters",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _priceRange = const RangeValues(20, 80);
                              _ratingFilter = 4.0;
                              _distanceFilter = '5 km';
                              _sortBy = 'recommended';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E6F86),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Clear Filters"),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredServices.length,
                    itemBuilder: (context, index) {
                      return _buildServiceCard(filteredServices[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveFilterChip(String label, String filterType) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: true,
        onSelected: (selected) {
          _removeFilter(filterType);
        },
        backgroundColor: const Color(0xFF1E6F86).withOpacity(0.1),
        selectedColor: const Color(0xFF1E6F86).withOpacity(0.2),
        checkmarkColor: const Color(0xFF1E6F86),
        labelStyle: const TextStyle(color: Color(0xFF1E6F86), fontSize: 12),
        deleteIcon: const Icon(Icons.close, size: 16, color: Color(0xFF1E6F86)),
        showCheckmark: false,
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
              // IMAGE - Changed from Image.network to Image.asset
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  service["image"],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: ${service["image"]} - $error');
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],
                      child: Icon(
                        _getCategoryIcon(service["category"]),
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
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
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            service["category"],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${service["rating"]} (${service["reviews"]} reviews)",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service["title"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          service["location"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.place, size: 14, color: Colors.grey),
                        const SizedBox(width: 2),
                        Text(
                          service["distance"] ?? "2.5 km",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          service["price"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF1E6F86),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E6F86).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            service["availability"] ?? "Available now",
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF1E6F86),
                            ),
                          ),
                        ),
                      ],
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
                        builder: (context) => DetailPage(
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
                          Icon(
                            Icons.remove_red_eye,
                            size: 18,
                            color: Color(0xFF1E6F86),
                          ),
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
                        builder: (context) => DetailPage(
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
                            color: Colors.white,
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

  // Helper method to get icon based on category
  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'plumber':
        return Icons.plumbing;
      case 'cleaner':
        return Icons.cleaning_services;
      case 'painter':
        return Icons.format_paint;
      case 'electrician':
        return Icons.electrical_services;
      case 'carpenter':
        return Icons.handyman;
      case 'mover':
        return Icons.local_shipping;
      case 'roofer':
        return Icons.roofing;
      default:
        return Icons.person;
    }
  }
}
