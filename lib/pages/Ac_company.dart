import 'package:flutter/material.dart';

class AcRepairServicesPage extends StatelessWidget {
  const AcRepairServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Header with Back Button and Title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Back button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                      color: const Color(0xFF1F6F86),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Title
                  const Text(
                    'AC COMPANY',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F6F86),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            // Main content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Service categories
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _categoryChip('All Services', false),
                          _categoryChip('AC Repair', true),
                          _categoryChip('Installation', false),
                          _categoryChip('Maintenance', false),
                          _categoryChip('Gas Refill', false),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Results count
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '6 services found',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Service cards list with company links
                    Expanded(
                      child: ListView(
                        children: [
                          _ServiceCard(
                            name: 'CoolMaster AC',
                            rating: 4.9,
                            reviews: 128,
                            specialty: 'AC Repair Specialist',
                            location: 'Phnom Penh city',
                            distance: '1.8 km',
                            price: '\$35.00/hr',
                            availability: 'Available now',
                            imagePath: 'assets/Images/images(6).jpeg',
                            companyId: 'coolmaster_ac',
                            onViewProfile: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyProfilePage(
                                    companyName: 'CoolMaster AC',
                                    companyImage:
                                        'assets/Images/images(6).jpeg',
                                    rating: 4.9,
                                    reviews: 128,
                                    specialty: 'AC Repair Specialist',
                                    location: 'Phnom Penh city',
                                    price: '\$35.00/hr',
                                  ),
                                ),
                              );
                            },
                            onBookNow: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingPage(
                                    companyName: 'CoolMaster AC',
                                    serviceType: 'AC Repair',
                                    price: '\$35.00/hr',
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          _ServiceCard(
                            name: 'Arctic Breeze',
                            rating: 4.8,
                            reviews: 94,
                            specialty: 'Installation & Repair',
                            location: 'Phnom Penh city',
                            distance: '2.5 km',
                            price: '\$38.00/hr',
                            availability: 'Available tomorrow',
                            imagePath: 'assets/Images/arctic_breeze.jpeg',
                            companyId: 'arctic_breeze',
                            onViewProfile: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyProfilePage(
                                    companyName: 'Arctic Breeze',
                                    companyImage:
                                        'assets/Images/arctic_breeze.jpeg',
                                    rating: 4.8,
                                    reviews: 94,
                                    specialty: 'Installation & Repair',
                                    location: 'Phnom Penh city',
                                    price: '\$38.00/hr',
                                  ),
                                ),
                              );
                            },
                            onBookNow: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingPage(
                                    companyName: 'Arctic Breeze',
                                    serviceType: 'AC Installation & Repair',
                                    price: '\$38.00/hr',
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          _ServiceCard(
                            name: 'Frost Air Care',
                            rating: 4.9,
                            reviews: 215,
                            specialty: 'Emergency AC Service',
                            location: 'Phnom Penh city',
                            distance: '1.2 km',
                            price: '\$42.00/hr',
                            availability: 'Available now',
                            imagePath: 'assets/Images/frost_air.jpeg',
                            companyId: 'frost_air',
                            onViewProfile: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyProfilePage(
                                    companyName: 'Frost Air Care',
                                    companyImage:
                                        'assets/Images/frost_air.jpeg',
                                    rating: 4.9,
                                    reviews: 215,
                                    specialty: 'Emergency AC Service',
                                    location: 'Phnom Penh city',
                                    price: '\$42.00/hr',
                                  ),
                                ),
                              );
                            },
                            onBookNow: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingPage(
                                    companyName: 'Frost Air Care',
                                    serviceType: 'Emergency AC Service',
                                    price: '\$42.00/hr',
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          _ServiceCard(
                            name: 'Chill Tech',
                            rating: 4.7,
                            reviews: 67,
                            specialty: 'Split AC Experts',
                            location: 'Phnom Penh city',
                            distance: '3.0 km',
                            price: '\$32.00/hr',
                            availability: 'Available now',
                            imagePath: 'assets/Images/chill_tech.jpeg',
                            companyId: 'chill_tech',
                            onViewProfile: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyProfilePage(
                                    companyName: 'Chill Tech',
                                    companyImage:
                                        'assets/Images/chill_tech.jpeg',
                                    rating: 4.7,
                                    reviews: 67,
                                    specialty: 'Split AC Experts',
                                    location: 'Phnom Penh city',
                                    price: '\$32.00/hr',
                                  ),
                                ),
                              );
                            },
                            onBookNow: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingPage(
                                    companyName: 'Chill Tech',
                                    serviceType: 'Split AC Repair',
                                    price: '\$32.00/hr',
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          _ServiceCard(
                            name: 'Polar HVAC',
                            rating: 4.9,
                            reviews: 156,
                            specialty: 'Commercial AC',
                            location: 'Phnom Penh city',
                            distance: '2.2 km',
                            price: '\$45.00/hr',
                            availability: 'Available tomorrow',
                            imagePath: 'assets/Images/polar_hvac.jpeg',
                            companyId: 'polar_hvac',
                            onViewProfile: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyProfilePage(
                                    companyName: 'Polar HVAC',
                                    companyImage:
                                        'assets/Images/polar_hvac.jpeg',
                                    rating: 4.9,
                                    reviews: 156,
                                    specialty: 'Commercial AC',
                                    location: 'Phnom Penh city',
                                    price: '\$45.00/hr',
                                  ),
                                ),
                              );
                            },
                            onBookNow: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingPage(
                                    companyName: 'Polar HVAC',
                                    serviceType: 'Commercial AC Service',
                                    price: '\$45.00/hr',
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          _ServiceCard(
                            name: 'EcoCool Solutions',
                            rating: 4.8,
                            reviews: 89,
                            specialty: 'Eco-friendly AC',
                            location: 'Phnom Penh city',
                            distance: '2.8 km',
                            price: '\$39.00/hr',
                            availability: 'Available now',
                            imagePath: 'assets/Images/ecocool.jpeg',
                            companyId: 'ecocool',
                            onViewProfile: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyProfilePage(
                                    companyName: 'EcoCool Solutions',
                                    companyImage: 'assets/Images/ecocool.jpeg',
                                    rating: 4.8,
                                    reviews: 89,
                                    specialty: 'Eco-friendly AC',
                                    location: 'Phnom Penh city',
                                    price: '\$39.00/hr',
                                  ),
                                ),
                              );
                            },
                            onBookNow: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingPage(
                                    companyName: 'EcoCool Solutions',
                                    serviceType: 'Eco-friendly AC Service',
                                    price: '\$39.00/hr',
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1F6F86) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF1F6F86) : Colors.grey.shade300,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String name;
  final double rating;
  final int reviews;
  final String specialty;
  final String location;
  final String distance;
  final String price;
  final String availability;
  final String imagePath;
  final String companyId;
  final VoidCallback onViewProfile;
  final VoidCallback onBookNow;

  const _ServiceCard({
    required this.name,
    required this.rating,
    required this.reviews,
    required this.specialty,
    required this.location,
    required this.distance,
    required this.price,
    required this.availability,
    required this.imagePath,
    required this.companyId,
    required this.onViewProfile,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with image and name
            Row(
              children: [
                // Profile image
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Name and rating
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            '$rating ($reviews reviews)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
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

            // Specialty
            Text(
              specialty,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            // Location and distance
            Row(
              children: [
                Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                Text(
                  ' • $distance',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Price
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 8),

            // Availability
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: availability.contains('now')
                    ? Colors.green.shade50
                    : Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                availability,
                style: TextStyle(
                  fontSize: 12,
                  color: availability.contains('now')
                      ? Colors.green.shade700
                      : Colors.orange.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onViewProfile,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(
                        color: const Color(0xFF1F6F86).withOpacity(0.3),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'View profile',
                      style: TextStyle(
                        color: const Color(0xFF1F6F86),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onBookNow,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: const Color(0xFF1F6F86),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Company Profile Page
class CompanyProfilePage extends StatelessWidget {
  final String companyName;
  final String companyImage;
  final double rating;
  final int reviews;
  final String specialty;
  final String location;
  final String price;

  const CompanyProfilePage({
    super.key,
    required this.companyName,
    required this.companyImage,
    required this.rating,
    required this.reviews,
    required this.specialty,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(companyName),
        backgroundColor: const Color(0xFF1F6F86),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company header image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(companyImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company name and rating
                  Text(
                    companyName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '$rating ($reviews reviews)',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Specialty
                  const Text(
                    'Specialty',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  // Location
                  const Text(
                    'Location',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[600],
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Price
                  const Text(
                    'Service Rate',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Book button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(
                              companyName: companyName,
                              serviceType: specialty,
                              price: price,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFF1F6F86),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Booking Page
class BookingPage extends StatelessWidget {
  final String companyName;
  final String serviceType;
  final String price;

  const BookingPage({
    super.key,
    required this.companyName,
    required this.serviceType,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Book Service'),
        backgroundColor: const Color(0xFF1F6F86),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking with $companyName',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _bookingDetailRow('Service:', serviceType),
                    const Divider(),
                    _bookingDetailRow('Rate:', price),
                    const Divider(),
                    _bookingDetailRow('Duration:', '2 hours (minimum)'),
                    const Divider(),
                    _bookingDetailRow('Total:', '\$70.00'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Booking confirmed with $companyName!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bookingDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
