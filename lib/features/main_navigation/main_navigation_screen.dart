import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // final screens = [
  //   // const Center(
  //   //   child: Text('Home'),
  //   // ),
  //   // const Center(
  //   //   child: Text('Discover'),
  //   // ),
  //   // const Center(
  //   //   child: Text(''),
  //   // ),
  //   // const Center(
  //   //   child: Text('Inbox'),
  //   // ),
  //   // const Center(
  //   //   child: Text('Profile'),
  //   // )
  //   StfScreen(key: GlobalKey()),
  //   StfScreen(key: GlobalKey()),
  //   Container(),
  //   StfScreen(key: GlobalKey()),
  //   StfScreen(key: GlobalKey()),
  // ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Record video"),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //body: screens.elementAt(_selectedIndex),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const VideoTimelineScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              label: "Home",
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTab(
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              label: "Discover",
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            Gaps.h24,
            GestureDetector(
              child: PostVideoButton(onTap: _onPostVideoButtonTap),
            ),
            Gaps.h24,
            NavTab(
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              label: "Inbox",
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavTab(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              label: "Profile",
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );

    // CupertinoTabScaffold(
    //   tabBar: CupertinoTabBar(
    //     items: const [
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.house),
    //         label: "Home",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: FaIcon(CupertinoIcons.search),
    //         label: "Search",
    //       ),
    //     ],
    //   ),
    //   tabBuilder: (context, index) => screens[index],
    // );

    // Scaffold(
    //   body: screens[_selectedIndex],
    //   bottomNavigationBar:
    // NavigationBar(
    //   selectedIndex: _selectedIndex,
    //   onDestinationSelected: _onTap,
    //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    //   destinations: const [
    //     NavigationDestination(
    //       icon: FaIcon(
    //         FontAwesomeIcons.house,
    //         color: Colors.white,
    //       ),
    //       label: 'Home',
    //     ),
    //     NavigationDestination(
    //       icon: FaIcon(
    //         FontAwesomeIcons.magnifyingGlass,
    //         color: Colors.amber,
    //       ),
    //       label: 'Search',
    //     )
    //   ],
    // ),

    // BottomNavigationBar(
    //   currentIndex: _selectedIndex,
    //   onTap: _onTap,
    //   selectedItemColor: Theme.of(context).primaryColor,
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: FaIcon(FontAwesomeIcons.house),
    //       label: "Home",
    //       tooltip: "what",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //       label: "Search",
    //       tooltip: "what",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //       label: "Search",
    //       tooltip: "what",
    //       backgroundColor: Colors.teal,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //       label: "Search",
    //       tooltip: "what",
    //       backgroundColor: Colors.yellow,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
    //       label: "Search",
    //       tooltip: "what",
    //       backgroundColor: Colors.blue,
    //     )
    //   ],
    // ),
  }
}
