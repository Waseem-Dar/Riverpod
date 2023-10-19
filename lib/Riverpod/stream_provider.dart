import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_riverpod_providers.dart';

class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var number = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("because"),
      ),
      body:Center(child:number.when(data: (data) {
        return Text(data.toString());
      }, error: (error, stackTrace) {
        return Text(error.toString());
      }, loading: () {
        return const CircularProgressIndicator();
      },),)
    );
  }
}
