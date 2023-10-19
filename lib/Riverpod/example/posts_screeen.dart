import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Riverpod/example/state.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final posts = ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(postsProvider);
            if (state is InitialState) {
              return const Text("Press Button");
            }
            if (state is LoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is ErrorState) {
              return Text(state.errorMessage);
            }
            if (state is LoadedState) {
              return Column(
                children: [
                  Expanded(child: ListView.builder(
                    itemCount: state.listPosts.length,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        title:  Text("data"),
                      );
                    },
                  ))
                ],
              );
            }
            return const Text("please wait");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postsProvider.notifier).fetchStats();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
