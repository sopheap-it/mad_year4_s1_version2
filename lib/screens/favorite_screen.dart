import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
                  "My Favorites ⭐",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Saved & Bookmarked",
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
                Icons.search_rounded,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          // Stats Row
          _statsRow(),
          const SizedBox(height: 32),

          // Recent Favorites
          _sectionTitle("Recently Added"),
          const SizedBox(height: 16),
          _favoritesList(),
          const SizedBox(height: 32),

          // Categories
          _sectionTitle("Categories"),
          const SizedBox(height: 16),
          _categoriesGrid(),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Color(0xFF2D3748),
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _statsRow() {
    return Row(
      children: [
        Expanded(
          child: _statsCard(
              "Total", "24", Icons.favorite_rounded, const Color(0xFFE53E3E)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _statsCard(
              "Articles", "12", Icons.article_rounded, const Color(0xFF667eea)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _statsCard("Videos", "8", Icons.play_circle_rounded,
              const Color(0xFF48BB78)),
        ),
      ],
    );
  }

  Widget _statsCard(String title, String count, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _favoritesList() {
    final favorites = [
      {
        "title": "Flutter Best Practices",
        "type": "Article",
        "date": "2 days ago",
        "icon": Icons.article_rounded
      },
      {
        "title": "Mobile App Development",
        "type": "Video",
        "date": "1 week ago",
        "icon": Icons.play_circle_rounded
      },
      {
        "title": "UI/UX Design Trends",
        "type": "Article",
        "date": "3 days ago",
        "icon": Icons.design_services_rounded
      },
    ];

    return Column(
      children: favorites.map((favorite) => _favoriteItem(favorite)).toList(),
    );
  }

  Widget _favoriteItem(Map<String, dynamic> favorite) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
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
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF667eea).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              favorite["icon"],
              color: const Color(0xFF667eea),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favorite["title"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      favorite["type"],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF667eea),
                      ),
                    ),
                    Text(
                      " • ${favorite["date"]}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_rounded,
              color: Color(0xFFE53E3E),
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _categoriesGrid() {
    final categories = [
      {
        "name": "Articles",
        "count": "12",
        "icon": Icons.article_rounded,
        "color": const Color(0xFF667eea)
      },
      {
        "name": "Videos",
        "count": "8",
        "icon": Icons.play_circle_rounded,
        "color": const Color(0xFF48BB78)
      },
      {
        "name": "Tutorials",
        "count": "6",
        "icon": Icons.school_rounded,
        "color": const Color(0xFFED8936)
      },
      {
        "name": "Resources",
        "count": "4",
        "icon": Icons.folder_rounded,
        "color": const Color(0xFF9F7AEA)
      },
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: categories.map((category) => _categoryCard(category)).toList(),
    );
  }

  Widget _categoryCard(Map<String, dynamic> category) {
    return Container(
      padding: const EdgeInsets.all(20),
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
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: category["color"].withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              category["icon"],
              color: category["color"],
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            category["count"],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: category["color"],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            category["name"],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }
}
