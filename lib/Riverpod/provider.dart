import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'all_riverpod_providers.dart';

class SimpleProvider extends ConsumerWidget {
  const SimpleProvider({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    String name = ref.read(stringProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title:const Text("Simple Provider"),),
      body: Center(child:
        Text(name),),
    );
  }
}
