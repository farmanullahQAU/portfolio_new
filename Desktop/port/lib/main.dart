import 'package:flutter/material.dart';
import 'package:port/responsive_wraper.dart';
import 'package:port/subpages/intro.dart';
import 'package:port/subpages/skills.dart';
import 'package:port/widgets/button.dart';

import 'subpages/about.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      theme: ThemeData(
          useMaterial3: false,
          // primaryColor: Colors.red,
          primarySwatch: Colors.red),
      // theme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      // darkTheme: ThemeData(useMaterial3: false, colorScheme: darkColorScheme),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHovered = false;
  bool _isExtended = false;
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  bool _isDarkTheme = false;

  void _toggleExtended() {
    setState(() {
      _isExtended = !_isExtended;
    });
  }

  void _onDestinationSelected(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: _isHovered ? 250 : 150,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _isHovered = false;
                  });
                },
                child: NavigationRail(
                  useIndicator: true,

                  indicatorColor: const Color.fromARGB(255, 32, 31, 31),

                  groupAlignment: 0.0,
                  // backgroundColor: const Color.fromARGB(255, 150, 6, 13),
                  extended: _isHovered || _isExtended,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_2_outlined),
                      label: Text('About'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.code),
                      label: Text('Works'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.mail),
                      selectedIcon: Icon(Icons.phone),
                      label: Text('Contact'),
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                      _onDestinationSelected(index);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: PageView(
                  pageSnapping: false,
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  children: const [
                    IntroView(),
                    AboutView(),
                    SkillsView(),
                    ContactPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleExtended,
          child: Icon(_isExtended ? Icons.arrow_back : Icons.arrow_forward),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: IconButton(
                icon: Icon(
                    _isDarkTheme ? Icons.wb_sunny : Icons.nightlight_round),
                onPressed: _toggleTheme,
              ),
            )),
      ),
    );
  }
}

class WorksPage extends StatelessWidget {
  const WorksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Works Page'),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(
        child: Text('Contact Page'),
      ),
    );
  }
}

class HomeButtons extends StatefulWidget {
  final double screenWidth;
  const HomeButtons({Key? key, required this.screenWidth}) : super(key: key);

  @override
  State<HomeButtons> createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons>
    with TickerProviderStateMixin {
  // AnimationController get animationController => _controller;
  // late final AnimationController _controller = AnimationController(
  //   value: 0.1,
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(reverse: true);
  // late final Animation<double> animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.fastOutSlowIn,
  // );
  // @override
  // initState() {
  //   initHomeContentsAnimation();
  //   super.initState();
  // }

  // void initHomeContentsAnimation() {
  //   _controller.addStatusListener((AnimationStatus status) {
  //     if (status == AnimationStatus.completed) {
  //       _controller.dispose();
  //     } else if (status == AnimationStatus.dismissed) {
  //       _controller.dispose();
  //     }
  //   });
  //   _controller.forward();
  // }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Container(
        child: Row(
          children: [
            SizedBox(
                width: 200,
                height: 50,
                child: MaterialButtonWidget(
                  borderColor: Colors.red,
                  color: Colors.redAccent.shade400,
                  hoverColor: const Color.fromARGB(255, 32, 31, 31),
                  child: const Text(
                    "HIRE ME",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // controller.navigateToContactView();
                  },
                )),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                width: 200,
                height: 50,
                child: MaterialButtonWidget(
                  borderColor: Colors.white,
                  color: Colors.black,
                  hoverColor: Colors.black45,
                  child: SizedBox(
                    width: 100,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.abc,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "resume",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                  ),
                  onPressed: () async {
                    // controller.openResume();
                  },
                )),
          ],
        ),
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 200,
              height: 50,
              child: MaterialButtonWidget(
                borderColor: Colors.red,
                color: Colors.redAccent.shade400,
                hoverColor: Colors.black,
                child: const Text(
                  "hire me",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  // controller.navigateToContactView();
                },
              )),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: 200,
              height: 50,
              child: MaterialButtonWidget(
                borderColor: Colors.white,
                color: Colors.black,
                hoverColor: Colors.black45,
                child: SizedBox(
                  width: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.abc,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "resume",
                          style: TextStyle(color: Colors.white),
                        ),
                      ]),
                ),
                onPressed: () {
                  // controller.openResume();
                },
              )),
        ],
      ),
    );
  }
}
