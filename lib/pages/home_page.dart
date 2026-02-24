import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  int _tab = 0;

  static const Color kTopTeal = Color(0xFF2C6E88);
  static const Color kBorder = Color(0xFFDBDBDB);
  static const Color kIconGray = Color(0xFF6B6B6B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Bottom nav like screenshot
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: (i) => setState(() => _tab = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2C6E88),
        unselectedItemColor: const Color(0xFF565E6B),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num_outlined),
            activeIcon: Icon(Icons.confirmation_num_rounded),
            label: "Service",
          ),
          BottomNavigationBarItem(
            icon: _Badge(
              count: 2,
              child: const Icon(Icons.notifications_none),
            ),
            activeIcon: _Badge(
              count: 2,
              child: const Icon(Icons.notifications),
            ),
            label: "Notifications",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            // Top teal bar
            Container(height: 54, color: kTopTeal),

            // Main scroll
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search row
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.location_on_outlined),
                          color: kIconGray,
                        ),
                        const SizedBox(width: 6),

                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: kBorder),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                const Icon(Icons.search, color: Color(0xFF6B6B6B)),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
                                    decoration: const InputDecoration(
                                      hintText: "Search...",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.person_outline),
                          color: Colors.black,
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Banner row (left big banner + right gray card)
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFFE9EEF3),
                              border: Border.all(color: const Color(0xFFE6E6E6)),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Stack(
                              children: [
                                // Placeholder "image"
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFF3D7FA1),
                                          Color(0xFF2C6E88),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Little top line like screenshot
                                Positioned(
                                  top: 6,
                                  left: 14,
                                  right: 14,
                                  child: Container(
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.55),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                // Banner text
                                const Positioned(
                                  left: 14,
                                  bottom: 14,
                                  right: 14,
                                  child: Text(
                                    "ALL YOU NEED\nTO KNOW ABOUT\nAC REPAIR",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      height: 1.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Grid section (2 rows of 3 big squares like screenshot)
                    _Grid3x2(),

                    const SizedBox(height: 18),

                    // Bottom small cards row (like screenshot)
                    Row(
                      children: [
                        _SmallCard(),
                        const SizedBox(width: 12),
                        _SmallCard(),
                        const SizedBox(width: 12),
                        _SmallCard(),
                        const SizedBox(width: 12),
                        _SmallCard(),
                      ],
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
}

class _Grid3x2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(child: _BigCard()),
            SizedBox(width: 12),
            Expanded(child: _BigCard()),
            SizedBox(width: 12),
            Expanded(child: _BigCard()),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: const [
            Expanded(child: _BigCard()),
            SizedBox(width: 12),
            Expanded(child: _BigCard()),
            SizedBox(width: 12),
            Expanded(child: _BigCard()),
          ],
        ),
      ],
    );
  }
}

class _BigCard extends StatelessWidget {
  const _BigCard();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

class _SmallCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final int count;
  final Widget child;

  const _Badge({required this.count, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (count > 0)
          Positioned(
            right: -6,
            top: -6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "$count",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
