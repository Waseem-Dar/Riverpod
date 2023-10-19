import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'all_provider.dart';


class CountProviderScreen extends StatefulWidget {
  const CountProviderScreen({super.key});

  @override
  State<CountProviderScreen> createState() => _CountProviderScreenState();
}

class _CountProviderScreenState extends State<CountProviderScreen> {
  // final int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final count = Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count.addCounting();
    });
  }
  @override
  Widget build(BuildContext context) {
    log("Hello");
    final count = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(builder: (context, value, child) {
              // log("Hello");
              return Text(value.count.toString(),style: const TextStyle(fontSize: 35,color: Colors.red),);
            },),
            )

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        count.addCounting();
      },
        child:const  Icon(Icons.add),
      ),
    );
  }
}
