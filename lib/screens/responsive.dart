import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_project/main.dart';
import 'package:url_launcher/url_launcher.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({Key? key}) : super(key: key);

  @override
  _DesignScreenState createState() => _DesignScreenState();
}

final _url = Uri.parse("https://pub.dev/");

class _DesignScreenState extends State<DesignScreen> {
  double margin = 5.0;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                log("Press");

                // const url = 'https://blog.logrocket.com';
                if (await canLaunchUrl(_url)) {
                  await launchUrl(_url);
                } else {
                  throw 'Could not launch $_url';
                }
              },
              icon: const Icon(Icons.add)),
        ],
        title: const Text("Design"),
        backgroundColor: Colors.red,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 550 && constraints.maxHeight > 325) {
            return _buildWideLayout();
          } else {
            return _buildNarrowLayout();
          }
        },
      ),
    );
  }

  Widget _buildNarrowLayout() {
    return Container(
      margin: EdgeInsets.all(margin),
      child: ListView(
        children: [
          for (int index = 0; index < Product.makeupProducts.length; index++)
            _buildContainer(0.5, index),
        ],
      ),
    );
  }

  Widget _buildWideLayout() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContainer(1.0, 0),
          Column(
            children: [
              for (int index = 1;
                  index < Product.makeupProducts.length;
                  index++)
                _buildContainer(0.5, index),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(double heightFactor, int index) {
    final item = Product.makeupProducts[index];
    return Card(
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.only(
            bottom: margin, right: heightFactor == 1.0 ? margin : 0),
        height: heightFactor == 1.0
            ? 300 * heightFactor + margin
            : 300 * heightFactor - margin,
        width: mq.width * .49 - (margin * 2),
        child: heightFactor == 1.0
            ? Column(
                children: [
                  Image.asset(
                    item['image'],
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                  Text(item['name'], style: const TextStyle(fontSize: 16)),
                  Text('\$ ${item['price']}',
                      style: const TextStyle(fontSize: 16)),
                  SizedBox(
                    width: 80,
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add '),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      item['image'],
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text('\$ ${item['price']}',
                          style: const TextStyle(fontSize: 16)),
                      SizedBox(
                        width: 80,
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Add'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

class Product {
  static List<Map<String, dynamic>> makeupProducts = [
    {
      'name': 'Lipstick',
      'price': 10.99,
      'category': 'Cosmetics',
      'title': 'Matte Red Lipstick',
      'image': 'assets/images/lip.png',
    },
    {
      'name': 'Eyeshadow',
      'price': 19.99,
      'category': 'Cosmetics',
      'title': 'Neutral Tones Eyeshadow Palette',
      'image': 'assets/images/platte.png',
    },
    {
      'name': 'Foundation',
      'price': 14.99,
      'category': 'Cosmetics',
      'title': 'Liquid Foundation - Ivory',
      'image': 'assets/images/found.png',
    },
  ];
}
