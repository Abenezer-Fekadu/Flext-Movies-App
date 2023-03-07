import 'package:flex_movies/presentation/screens/discover_screen.dart';
import 'package:flex_movies/presentation/screens/favorite_screen.dart';
import 'package:flex_movies/presentation/screens/home_screen.dart';
import 'package:flex_movies/presentation/screens/search_screen.dart';
import 'package:flex_movies/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: screenHeight * 0.08,
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.02),
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: Row(
            children: [
              Container(
                width: screenWidth * 0.10,
                height: screenWidth * 0.10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQc0slekZ9XFM4E-8HD67qmooXoiryocZW8v4ow6ntCw&s"),
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: screenHeight * 0.016,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.004,
                    ),
                    Text(
                      "Abeni27 F.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight * 0.021,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: buildCurrentPage(selectedIndex),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: screenHeight * 0.07,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavBar(screenHeight, 0, Icons.home_max_outlined),
              buildNavBar(screenHeight, 1, Icons.search),
              buildNavBar(screenHeight, 2, Icons.explore),
              buildNavBar(screenHeight, 3, Icons.favorite_border_outlined),
              buildNavBar(screenHeight, 4, Icons.more_horiz_sharp),
            ],
          ),
        ),
      ),
    );
  }

  buildCurrentPage(int i) {
    switch (i) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const FavoriteScreen();
      case 3:
        return const DiscoverScreen();
      case 4:
        return const SettingScreen();
      default:
        return Container();
    }
  }

  Widget buildNavBar(double screenHeight, int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.01, vertical: screenHeight * 0.007),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.grey : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: selectedIndex == index ? Colors.white : Colors.grey,
          size: screenHeight * 0.035,
        ),
      ),
    );
  }
}
