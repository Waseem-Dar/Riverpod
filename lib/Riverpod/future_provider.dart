import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_riverpod_providers.dart';

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: const Text("Future Provider"),
      backgroundColor: Colors.pink,),
      body:  Center(
        child:ref.watch(futureProvider ).when(data: (data) {
          return Text(data);
        }, error: (error, stackTrace) {
          return Text(error.toString());
        }, loading: () {
          return const  CircularProgressIndicator();
        },) ,
      ),
    );
  }
}
