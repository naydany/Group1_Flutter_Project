import 'package:flutter/material.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  int _selectedIndex = 0;
  int _selectedTabIndex = 0; // 0: Upcoming, 1: Completed, 2: Cancelled

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildCategoryTabs(),
            const SizedBox(height: 16),
            Expanded(child: _buildBookingList()),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Back to homepage
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0F2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.arrow_back, color: Color(0xFF1E6F86)),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              "Booking Histories",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F0F2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.more_horiz, color: Color(0xFF1E6F86)),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildTabButton("Upcoming", index: 0),
          const SizedBox(width: 12),
          _buildTabButton("Completed", index: 1),
          const SizedBox(width: 12),
          _buildTabButton("Cancelled", index: 2),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, {required int index}) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1E6F86) : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isSelected ? Colors.transparent : Colors.grey.shade300,
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade600,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookingList() {
    List<Map<String, dynamic>> allBookings = [
      // Upcoming bookings
      {
        "service": "Fixing Air Conditional",
        "provider": "Technology Cambodia",
        "date": "14/02/2026 10:56",
        "location": "1.2Km | 1h12m from you",
        "status": "upcoming",
        "image": "assets/Images/ac_service.jpg",
        "price": "\$30.00/hr",
      },
      {
        "service": "Fixing Fan",
        "provider": "Technology Cambodia",
        "date": "10/05/2026 08:56",
        "location": "Phnom penh city.",
        "status": "upcoming",
        "image": "assets/Images/fan_service.jpg",
        "price": "\$25.00/hr",
      },

      // Completed bookings
      {
        "service": "Plumbing Repair",
        "provider": "Expert Plumbing",
        "date": "05/03/2026 14:30",
        "location": "2.5Km from you",
        "status": "completed",
        "image": "assets/Images/plumbing_service.jpg",
        "price": "\$45.00",
        "completedDate": "05/03/2026",
      },
      {
        "service": "Electrical Wiring",
        "provider": "Tech Electric",
        "date": "28/02/2026 09:15",
        "location": "1.8Km from you",
        "status": "completed",
        "image": "assets/Images/electrician.jpg",
        "price": "\$60.00",
        "completedDate": "28/02/2026",
      },

      // Cancelled bookings
      {
        "service": "Painting Service",
        "provider": "Color Master",
        "date": "15/03/2026 13:00",
        "location": "3.0Km from you",
        "status": "cancelled",
        "image": "assets/Images/painting.jpeg",
        "price": "\$0.00",
        "cancelledDate": "14/03/2026",
        "cancellationReason": "Customer cancelled",
      },
      {
        "service": "Carpenter Service",
        "provider": "Wood Expert",
        "date": "12/03/2026 11:30",
        "location": "2.0Km from you",
        "status": "cancelled",
        "image": "assets/Images/carpenter.webp",
        "price": "\$0.00",
        "cancelledDate": "11/03/2026",
        "cancellationReason": "Provider unavailable",
      },
    ];

    // Filter bookings based on selected tab
    List<Map<String, dynamic>> filteredBookings;
    switch (_selectedTabIndex) {
      case 0:
        filteredBookings = allBookings
            .where((b) => b["status"] == "upcoming")
            .toList();
        break;
      case 1:
        filteredBookings = allBookings
            .where((b) => b["status"] == "completed")
            .toList();
        break;
      case 2:
        filteredBookings = allBookings
            .where((b) => b["status"] == "cancelled")
            .toList();
        break;
      default:
        filteredBookings = allBookings;
    }

    if (filteredBookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _selectedTabIndex == 0
                  ? Icons.event_available
                  : _selectedTabIndex == 1
                  ? Icons.check_circle_outline
                  : Icons.cancel_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              _selectedTabIndex == 0
                  ? "No upcoming bookings"
                  : _selectedTabIndex == 1
                  ? "No completed bookings"
                  : "No cancelled bookings",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: filteredBookings.length,
      itemBuilder: (context, index) {
        final booking = filteredBookings[index];
        return GestureDetector(
          onTap: () {
            // Navigate to detail page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailServicePage(booking: booking),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          booking["image"],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFFE8F0F2),
                              child: Icon(
                                booking["status"] == "completed"
                                    ? Icons.check
                                    : booking["status"] == "cancelled"
                                    ? Icons.close
                                    : Icons.build,
                                color: const Color(0xFF1E6F86),
                                size: 30,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booking["service"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFFFB800),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "4.7",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  booking["provider"],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildInfoItem(
                      Icons.calendar_today_outlined,
                      booking["date"],
                    ),
                    const SizedBox(width: 16),
                    _buildInfoItem(
                      Icons.location_on_outlined,
                      booking["location"],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusBadge(booking["status"]),

                    if (booking["status"] == "upcoming")
                      Row(
                        children: [
                          _buildActionButton(
                            icon: Icons.message_outlined,
                            label: "Chat",
                          ),
                          const SizedBox(width: 12),
                          _buildActionButton(
                            icon: Icons.call_outlined,
                            label: "Call",
                            isPrimary: true,
                          ),
                        ],
                      ),

                    if (booking["status"] == "completed")
                      Text(
                        "Completed on ${booking["completedDate"]}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    if (booking["status"] == "cancelled")
                      Text(
                        "Cancelled",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    IconData icon;
    String text;

    switch (status) {
      case "completed":
        color = Colors.green;
        icon = Icons.check_circle;
        text = "Completed";
        break;
      case "cancelled":
        color = Colors.red;
        icon = Icons.cancel;
        text = "Cancelled";
        break;
      default:
        color = const Color(0xFF1E6F86);
        icon = Icons.access_time;
        text = "Upcoming";
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade500),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    bool isPrimary = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF1E6F86) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isPrimary ? Colors.transparent : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isPrimary ? Colors.white : Colors.grey.shade600,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: isPrimary ? Colors.white : Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.pop(context); // Go back to Home
              break;
            case 1:
              // Navigate to Service
              break;
            case 2:
              // Already on Notifications/History
              break;
            case 3:
              // Navigate to Profile
              break;
          }
        },
        selectedItemColor: const Color(0xFF1E6F86),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num_outlined),
            label: "Service",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// Updated Detail Service Page
class DetailServicePage extends StatelessWidget {
  final Map<String, dynamic> booking;

  const DetailServicePage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Detail Service",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Image
            Container(
              height: 250,
              width: double.infinity,
              color: const Color(0xFFE8F0F2),
              child: Center(
                child: Icon(
                  booking["status"] == "completed"
                      ? Icons.check_circle
                      : booking["status"] == "cancelled"
                      ? Icons.cancel
                      : Icons.build_circle,
                  size: 80,
                  color: const Color(0xFF1E6F86),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Provider Info
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFFE8F0F2),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Color(0xFF1E6F86),
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking["provider"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F0F2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Color(0xFFFFB800),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "4.7",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Technology Cambodia",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Service Info
                  Text(
                    booking["service"],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _buildInfoChip(Icons.location_on, booking["location"]),
                      const SizedBox(width: 12),
                      _buildInfoChip(Icons.access_time, "1h12m"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Price",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        booking["price"] ?? "\$30.00/hr",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: booking["status"] == "cancelled"
                              ? Colors.grey
                              : const Color(0xFF1E6F86),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Status-specific actions
                  if (booking["status"] == "upcoming") ...[
                    Row(
                      children: [
                        Expanded(
                          child: _buildDetailActionButton(
                            "Reschedule",
                            isOutlined: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDetailActionButton(
                            "Cancel",
                            isOutlined: true,
                            isDestructive: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E6F86),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Contact Provider",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],

                  if (booking["status"] == "completed") ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Completed on ${booking["completedDate"]}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("Write a Review"),
                          ),
                        ],
                      ),
                    ),
                  ],

                  if (booking["status"] == "cancelled") ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Column(
                        children: [
                          const Icon(Icons.cancel, color: Colors.red, size: 40),
                          const SizedBox(height: 8),
                          Text(
                            "Booking Cancelled",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (booking["cancellationReason"] != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              "Reason: ${booking["cancellationReason"]}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red.shade600,
                              ),
                            ),
                          ],
                          const SizedBox(height: 12),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF1E6F86),
                              side: const BorderSide(color: Color(0xFF1E6F86)),
                            ),
                            child: const Text("Book Again"),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Information Section
                  const Text(
                    "Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  _buildInfoRow("Service Type", booking["service"]),
                  _buildInfoRow("Date & Time", booking["date"]),
                  _buildInfoRow("Duration", "1-2 hours"),
                  _buildInfoRow("Payment Method", "Cash/Card"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade600),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailActionButton(
    String text, {
    required bool isOutlined,
    bool isDestructive = false,
  }) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: isOutlined
            ? Colors.transparent
            : (isDestructive ? Colors.red : const Color(0xFF1E6F86)),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: isOutlined
              ? (isDestructive ? Colors.red.shade300 : Colors.grey.shade300)
              : Colors.transparent,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isOutlined
                ? (isDestructive ? Colors.red : Colors.black87)
                : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
