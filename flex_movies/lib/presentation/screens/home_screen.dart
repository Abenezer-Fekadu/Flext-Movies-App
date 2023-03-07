import 'package:flex_movies/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: screenWidth * 0.02),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              isScrollable: true,
              labelPadding: EdgeInsets.only(
                  left: screenWidth * 0.03, right: screenWidth * 0.03),
              indicator: CircleTabIndicator(color: Colors.white, radius: 4),
              tabs: [
                Tab(text: "Movies"),
                Tab(text: "Tv Series"),
                Tab(text: "Anime"),
                Tab(text: "My List"),
              ],
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: screenHeight * 0.4,
          child: TabBarView(
            controller: _tabController,
            children: [
              Text("T"),
              Text("T"),
              Text("A"),
              Text("L"),
            ],
          ),
        ),
      ],
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
