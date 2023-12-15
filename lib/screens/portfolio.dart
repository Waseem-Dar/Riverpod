import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_project/main.dart';

class PortFolio extends StatefulWidget {
  const PortFolio({super.key});

  @override
  State<PortFolio> createState() => _PortFolioState();
}

class _PortFolioState extends State<PortFolio> {
  List<String> names = ["Freelancer", "Developer", "Designer", "Photographer"];
  int currentIndex = 0;
  int currentIndexIndex = 0;
  String letter = "";
  bool reverse = false;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        if (reverse) {
          if (currentIndexIndex < names[currentIndex].length) {
            letter += names[currentIndex][currentIndexIndex];
            currentIndexIndex++;
          } else {
            reverse = !reverse;
          }
        } else if (letter.isNotEmpty) {
          letter = letter.substring(0, letter.length - 1);
        } else {
          reverse = !reverse;
          currentIndexIndex = 0;
          currentIndex = (currentIndex + 1) % names.length;
          letter = "";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    double imageContainerHeight = 0;

    if (mq.width > 1200) {
      imageContainerHeight = mq.height * 0.9; // For desktop
    } else if (mq.width > 600) {
      imageContainerHeight = mq.height * 0.8; // For tablet
    } else {
      imageContainerHeight = mq.height * 0.6; // For mobile
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: imageContainerHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/largepic.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: imageContainerHeight,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Alex Smithw",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "I'm ",
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: letter.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  decorationThickness: 2,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  color: Colors.red,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
