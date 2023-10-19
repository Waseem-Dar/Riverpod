import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'all_provider.dart';

class SliderProviderScreen extends StatelessWidget {
  const SliderProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SliderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider View"),
      ),
      body: Column(
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                  });
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 100,
                    color: Colors.green.withOpacity(value.value),
                    child: const Center(
                      child: Text("Container 1"),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 100,
                    color: Colors.red.withOpacity(value.value),
                    child: const Center(
                      child: Text("Container 2"),
                    ),
                  ))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
