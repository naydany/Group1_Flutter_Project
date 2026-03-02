import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String selectedFilter = 'All'; // All, Unread, Mentions
  
  // Sample notification data
  final List<Map<String, dynamic>> notifications = [
    {
      'id': 1,
      'title': 'New Service Available',
      'description': 'Your booking request for plumbing service has been accepted',
      'time': '5 min ago',
      'type': 'booking',
      'isRead': false,
      'image': 'https://images.unsplash.com/photo-1581578731548-c64695cc6952',
      'percentage': '30%',
    },
    {
      'id': 2,
      'title': 'New Service Available',
      'description': 'Special discount on cleaning services this weekend',
      'time': '1 hour ago',
      'type': 'promo',
      'isRead': false,
      'image': 'https://images.unsplash.com/photo-1581578731548-c64695cc6952',
      'percentage': '30%',
    },
    {
      'id': 3,
      'title': 'New Service Available',
      'description': 'Your payment has been processed successfully',
      'time': '3 hours ago',
      'type': 'payment',
      'isRead': false,
      'image': 'https://images.unsplash.com/photo-1581578731548-c64695cc6952',
      'percentage': '30%',
    },
    {
      'id': 4,
      'title': 'New Service Available',
      'description': 'Electrical repair services now available in your area',
      'time': 'Yesterday',
      'type': 'service',
      'isRead': true,
      'image': 'https://images.unsplash.com/photo-1581578731548-c64695cc6952',
      'percentage': '30%',
    },
    {
      'id': 5,
      'title': 'Review Request',
      'description': 'How was your experience with Expert Plumbing?',
      'time': 'Yesterday',
      'type': 'review',
      'isRead': true,
      'image': 'https://images.unsplash.com/photo-1581578731548-c64695cc6952',
      'percentage': '30%',
    },
    {
      'id': 6,
      'title': 'Booking Reminder',
      'description': 'Your cleaning service starts in 2 hours',
      'time': '2 days ago',
      'type': 'reminder',
      'isRead': true,
      'image': 'https://images.unsplash.com/photo-1581578731548-c64695cc6952',
      'percentage': '30%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildFilterTabs(),
          Expanded(
            child: _buildNotificationList(),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF1E6F86),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        "Notifications",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.done_all, color: Colors.white),
          onPressed: () {
            // Mark all as read
            setState(() {
              for (var notification in notifications) {
                notification['isRead'] = true;
              }
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('All notifications marked as read'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onSelected: (value) {
            if (value == 'settings') {
              // Navigate to notification settings
            } else if (value == 'clear') {
              // Clear all notifications
              setState(() {
                notifications.clear();
              });
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'settings',
              child: Row(
                children: [
                  Icon(Icons.settings, size: 18),
                  SizedBox(width: 8),
                  Text('Notification Settings'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'clear',
              child: Row(
                children: [
                  Icon(Icons.delete_sweep, size: 18),
                  SizedBox(width: 8),
                  Text('Clear All'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterTabs() {
    List<String> filters = ['All', 'Unread', 'Mentions'];
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Row(
        children: filters.map((filter) {
          bool isSelected = selectedFilter == filter;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = filter;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF1E6F86) : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  filter,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNotificationList() {
    // Filter notifications based on selected filter
    var filteredNotifications = notifications.where((notification) {
      if (selectedFilter == 'All') return true;
      if (selectedFilter == 'Unread') return notification['isRead'] == false;
      // For 'Mentions', you can add custom logic
      return true;
    }).toList();

    if (filteredNotifications.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredNotifications.length,
      itemBuilder: (context, index) {
        final notification = filteredNotifications[index];
        return _buildNotificationCard(notification);
      },
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: InkWell(
        onTap: () {
          // Mark as read when tapped
          setState(() {
            notification['isRead'] = true;
          });
          // Handle notification tap
          _handleNotificationTap(notification);
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: notification['isRead'] == false
                ? const Color(0xFF1E6F86).withOpacity(0.05)
                : Colors.transparent,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Notification Icon/Image
              _buildNotificationIcon(notification['type']),
              
              const SizedBox(width: 16),
              
              // Notification Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title with Burmese text
                    Text(
                      notification['title'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: notification['isRead'] == false
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: notification['isRead'] == false
                            ? const Color(0xFF1E6F86)
                            : Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 4),
                    
                    // Description
                    Text(
                      notification['description'],
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Time and Status Row
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          notification['time'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                        
                        const SizedBox(width: 12),
                        
                        // Discount Badge (if applicable)
                        if (notification['type'] == 'promo')
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00C853).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              notification['percentage'],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF00C853),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                        const Spacer(),
                        
                        // Unread Indicator
                        if (notification['isRead'] == false)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1E6F86),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon(String type) {
    IconData iconData;
    Color iconColor;
    
    switch (type) {
      case 'booking':
        iconData = Icons.calendar_today;
        iconColor = const Color(0xFF1E6F86);
        break;
      case 'promo':
        iconData = Icons.discount;
        iconColor = const Color(0xFF00C853);
        break;
      case 'payment':
        iconData = Icons.payment;
        iconColor = Colors.orange;
        break;
      case 'service':
        iconData = Icons.build;
        iconColor = Colors.purple;
        break;
      case 'review':
        iconData = Icons.rate_review;
        iconColor = Colors.amber;
        break;
      case 'reminder':
        iconData = Icons.alarm;
        iconColor = Colors.red;
        break;
      default:
        iconData = Icons.notifications;
        iconColor = Colors.grey;
    }
    
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: 24,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_none,
              size: 60,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'No Notifications',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'You don\'t have any notifications at the moment',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _handleNotificationTap(Map<String, dynamic> notification) {
    // Handle different notification types
    switch (notification['type']) {
      case 'booking':
        // Navigate to booking details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Opening booking details...'),
            duration: const Duration(seconds: 1),
          ),
        );
        break;
      case 'promo':
        // Navigate to promo details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Opening promotion details...'),
            duration: const Duration(seconds: 1),
          ),
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notification opened'),
            duration: const Duration(seconds: 1),
          ),
        );
    }
  }
}