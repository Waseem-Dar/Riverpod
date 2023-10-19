import 'package:flutter/material.dart';
import 'package:new_project/Provider/all_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Favorite App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 25),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white, width: 2)),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteItemsScreen(),
                    ));
              },
              icon: const Icon(Icons.favorite),
              color: Colors.white,
            ),
          )
        ],
      ),
      // appbar revelation
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: fav.nameList.length,
            itemBuilder: (context, index) {
              return Card(child: Consumer<FavoriteProvider>(
                builder: (context, value, child) {
                  return ListTile(
                    leading: const Icon(
                      Icons.ac_unit,
                      color: Colors.amber,
                    ),
                    title: Text(value.nameList[index]),
                    subtitle: const Text("more..."),
                    trailing: IconButton(
                      onPressed: () {
                        value.list.contains(index)
                            ? value.removeIndex(index)
                            : value.addIndex(index);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: value.list.contains(index)
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                  );
                },
              ));
            },
          ))
        ],
      ),
    );
  }
}

class FavoriteItemsScreen extends StatelessWidget {
  const FavoriteItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final favItems = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Favorite Items"),
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<FavoriteProvider>(
            builder: (context, value, child) {
              return value.list.isEmpty
                  ? const Center(
                      child: Text("No Data"),
                    )
                  : ListView.builder(
                      itemCount: value.list.length,
                      itemBuilder: (context, index) {
                        final itemIndex = value.list[index];
                        final itemName = value.nameList[itemIndex];
                        return Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.ac_unit,
                              color: Colors.amber,
                            ),
                            title: Text(itemName),
                            subtitle: const Text("more..."),
                            trailing: IconButton(
                              onPressed: () {
                                value.removeIndex(itemIndex);

                                },
                              icon:
                                  const Icon(Icons.favorite, color: Colors.red),
                            ),
                          ),
                        );
                      },
                );
            },
          ))
        ],
      ),
    );
  }
}
