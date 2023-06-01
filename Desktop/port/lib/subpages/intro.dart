import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:port/responsive_wraper.dart';

import '../widgets/button.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (bcontext, BoxConstraints constraints) {
      double width = constraints.maxWidth;

      return ResponsiveWidget(
        largeScreen: Container(
          color: const Color.fromARGB(255, 32, 31, 31),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
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
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          transform: Matrix4.identity()
                            ..scale(_isHovered
                                ? 1.1
                                : 1.0), // Apply the scale based on hover state

                          child: SizedBox(
                            width: width * 0.2 + 50,
                            height: width * 0.2 + 50,
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 20,
                                  bottom: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    width: width * 0.2,
                                    height: width * 0.2,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 20,
                                  bottom: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffE50914),
                                        shape: BoxShape.circle),
                                    width: width * 0.2,
                                    height: width * 0.2,
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            "assets/images/me.jpg",
                                          )),
                                      shape: BoxShape.circle),
                                  width: width * 0.2,
                                  height: width * 0.2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hi THERRE! I'M",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2)),
                            const SizedBox(
                              height: 32,
                            ),
                            RichText(
                                text: TextSpan(
                              text: "FARMAN ULLAH ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "YOUSAFZAI ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xffE50914)),
                                ),
                              ],
                            )),
                            const SizedBox(
                              height: 32,
                            ),
                            SizedBox(
                              width: width * 0.4,
                              child: RichText(
                                  text: TextSpan(
                                text: "A ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: Colors.white),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Fullstack mobile app developer",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            letterSpacing: 2,
                                            wordSpacing: 2,
                                            color: Colors.red),
                                  ),
                                  TextSpan(
                                    text:
                                        " passionate about creating interactive applications and experiences on the web.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            letterSpacing: 2,
                                            wordSpacing: 2,
                                            color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: 200,
                                    height: 50,
                                    child: MaterialButtonWidget(
                                      borderColor: Colors.red,
                                      color: Colors.redAccent.shade400,
                                      hoverColor:
                                          const Color.fromARGB(255, 32, 31, 31),
                                      child: const Text(
                                        "Resume",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        // controller.navigateToContactView();
                                      },
                                    )),

                                const SizedBox(
                                  width: 80,
                                ),
                                MaterialButton(
                                    height: 50,
                                    minWidth: 50,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(500),
                                    ),
                                    color: Colors.white,
                                    hoverColor: Colors.red,
                                    hoverElevation: 12,
                                    onPressed: () {},
                                    child: const FaIcon(
                                      FontAwesomeIcons.github,
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                MaterialButton(
                                    height: 50,
                                    minWidth: 50,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(500),
                                    ),
                                    color: Colors.white,
                                    hoverColor: Colors.red,
                                    hoverElevation: 12,
                                    onPressed: () {},
                                    child: const FaIcon(
                                      FontAwesomeIcons.linkedin,
                                    ))
                                // IconButton(
                                //     focusColor: Colors.pink,
                                //     hoverColor: Colors.white,
                                //     onPressed: () {},
                                //     icon: const FaIcon(FontAwesomeIcons.github))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )

                  // const Positioned(
                  //   left: 20,
                  //   top: 0,
                  //   bottom: 0,
                  //   child: CircleAvatar(
                  //     backgroundColor: Colors.yellow,
                  //   ),
                  // ),,

                  ,
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         elevation: 100,
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 16, vertical: 8),
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(50))),
                  //     onPressed: () {},
                  //     child: const Padding(
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  //       child: Text("Hire me"),
                  //     ))
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
