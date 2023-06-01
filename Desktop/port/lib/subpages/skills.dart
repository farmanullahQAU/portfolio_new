import 'package:flutter/material.dart';
import 'package:port/responsive_wraper.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      return Container(
        color: const Color.fromARGB(255, 32, 31, 31),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveWidget(
                largeScreen: Column(
                  children: [
                    SizedBox(
                      width: width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 1,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                "CHECKOUT MY",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Colors.white, letterSpacing: 2),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            "SKILLS",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: Colors.white, letterSpacing: 2),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 64),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 32),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: const Color.fromARGB(255, 32, 32, 32),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      // SvgPicture.asset(
                                      //   "assets/images/flutter.svg",
                                      //   width: 50,
                                      //   height: 50,
                                      // )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                mediumScreen: SizedBox(
                  width: width * 0.8,
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "ABOUT ME",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                            ),
                          ],
                        ),
                        const Text(
                            "I'm a front-end web developer with a background in computer systems and network infrastructure. My 8 years of IT experience has given me a strong foundation for web development and building complex solutions. Recently, I graduated from the Juno College Immersive Web Development Bootcamp. I am passionate about coding and solving problems through code, and I am excited to work alongside other amazing programmers and learn so much more!")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
