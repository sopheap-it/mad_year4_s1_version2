import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _appBar(context),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: _body(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notifications 🔔",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Stay Updated",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.mark_email_read_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        // Filter Tabs
        _filterTabs(),
        // Stats Overview
        _statsOverview(),
        // Notifications List
        Expanded(
          child: _notificationsList(),
        ),
      ],
    );
  }

  Widget _filterTabs() {
    final filters = ['All', 'Unread', 'System', 'Updates'];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFF667eea) : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  filter,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.grey[600],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _statsOverview() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF667eea).withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem("12", "Total", Icons.notifications_rounded),
          _statItem("3", "Unread", Icons.circle),
          _statItem("2", "Today", Icons.today_rounded),
        ],
      ),
    );
  }

  Widget _statItem(String count, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _notificationsList() {
    final notifications = [
      {
        "title": "Welcome to MAD Year 4!",
        "message":
            "Thanks for joining us. Explore all the amazing features we have for you.",
        "time": "2 min ago",
        "type": "welcome",
        "isRead": false,
        "icon": Icons.celebration_rounded,
        "color": const Color(0xFF48BB78),
      },
      {
        "title": "Security Update",
        "message": "Your account security has been enhanced with new features.",
        "time": "1 hour ago",
        "type": "security",
        "isRead": false,
        "icon": Icons.security_rounded,
        "color": const Color(0xFFE53E3E),
      },
      {
        "title": "New Feature Available",
        "message": "Check out the new dashboard insights and analytics tools.",
        "time": "3 hours ago",
        "type": "feature",
        "isRead": true,
        "icon": Icons.auto_awesome_rounded,
        "color": const Color(0xFF667eea),
      },
      {
        "title": "Daily Report Ready",
        "message":
            "Your productivity report for today is now available to view.",
        "time": "6 hours ago",
        "type": "report",
        "isRead": true,
        "icon": Icons.assessment_rounded,
        "color": const Color(0xFFED8936),
      },
      {
        "title": "Reminder: Team Meeting",
        "message":
            "Don't forget about the team meeting scheduled for tomorrow at 2 PM.",
        "time": "1 day ago",
        "type": "reminder",
        "isRead": true,
        "icon": Icons.event_rounded,
        "color": const Color(0xFF9F7AEA),
      },
      {
        "title": "App Update Available",
        "message":
            "Version 2.1 is now available with bug fixes and improvements.",
        "time": "2 days ago",
        "type": "update",
        "isRead": true,
        "icon": Icons.system_update_rounded,
        "color": const Color(0xFF38B2AC),
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return _notificationItem(notifications[index]);
      },
    );
  }

  Widget _notificationItem(Map<String, dynamic> notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: notification["isRead"]
              ? Colors.grey[200]!
              : const Color(0xFF667eea).withOpacity(0.2),
          width: notification["isRead"] ? 1 : 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: notification["color"].withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                notification["icon"],
                color: notification["color"],
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification["title"],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                      ),
                      if (!notification["isRead"])
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF667eea),
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification["message"],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 14,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        notification["time"],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      _notificationTypeChip(notification["type"]),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.grey[400],
                size: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'mark_read',
                  child: Row(
                    children: [
                      Icon(
                        notification["isRead"]
                            ? Icons.mark_email_unread
                            : Icons.mark_email_read,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(notification["isRead"]
                          ? 'Mark as Unread'
                          : 'Mark as Read'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline,
                        size: 16,
                        color: Colors.red[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Delete',
                        style: TextStyle(color: Colors.red[600]),
                      ),
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                // Handle menu actions
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationTypeChip(String type) {
    final typeColors = {
      'welcome': const Color(0xFF48BB78),
      'security': const Color(0xFFE53E3E),
      'feature': const Color(0xFF667eea),
      'report': const Color(0xFFED8936),
      'reminder': const Color(0xFF9F7AEA),
      'update': const Color(0xFF38B2AC),
    };

    final color = typeColors[type] ?? Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        type.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
