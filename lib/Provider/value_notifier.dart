import 'package:flutter/material.dart';

class ValueNotifierScreen extends StatelessWidget {
  ValueNotifierScreen({super.key});

  ValueNotifier<int> counter = ValueNotifier(0);
  ValueNotifier<bool> toggle = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Notifier"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: toggle.value,
                decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: IconButton(
                        onPressed: () {
                          toggle.value = !toggle.value;
                        },
                        icon:  Icon(toggle.value?Icons.visibility_off_rounded : Icons.visibility))),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: counter,
            builder: (context, value, child) {
              return Text(
                counter.value.toString(),
                style: const TextStyle(fontSize: 35, color: Colors.pink),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
          // log(counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
