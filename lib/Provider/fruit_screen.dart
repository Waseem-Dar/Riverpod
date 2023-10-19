import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'all_provider.dart';

class FruitScreen extends StatelessWidget {
  const FruitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fruitClassProvider = Provider.of<FruitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FruitFavoriteScreen(),
                    ));
              },
              icon: const Icon(Icons.favorite,)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                physics:const  BouncingScrollPhysics(),
            itemCount: fruitClassProvider.fruitList.length,
            itemBuilder: (context, index) {
              final item = fruitClassProvider.fruitList[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),

                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(item: item, index: index),
                        ));
                  },
                  child: SizedBox(
                    height: 110,
                    child: Card(
                      // shadowColor: Colors.teal,
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                      image: NetworkImage(item["image"]),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["name"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                    width: 120,
                                    child: Text(
                                      item["description"],
                                      maxLines: 2,
                                    )),
                                const Spacer(),
                                Text("\$  ${item["price"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  fruitClassProvider.favorite.contains(index)
                                      ? fruitClassProvider.removeFavorite(index)
                                      : fruitClassProvider.addFavorite(index);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: fruitClassProvider.favorite
                                          .contains(index)
                                      ? Colors.teal
                                      : Colors.grey,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  final int index;
  const DetailScreen({super.key, required this.item, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final fruitClassProvider = Provider.of<FruitProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.item["name"]),
      //   backgroundColor: Colors.teal,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "Image-Location${widget.item["image"]}",
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.item["image"]),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item["name"],
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item["description"]),
                    IconButton(
                        onPressed: () {
                          fruitClassProvider.favorite.contains(widget.index)
                              ? fruitClassProvider.removeFavorite(widget.index)
                              : fruitClassProvider.addFavorite(widget.index);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color:
                              fruitClassProvider.favorite.contains(widget.index)
                                  ? Colors.teal
                                  : Colors.grey,
                        )),
                    // const FavoriteButtonIcon(isFav: widget.item["favorite"],
                  ],
                ),
                Text(
                  "\$${widget.item["price"]}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FruitFavoriteScreen extends StatelessWidget {
  const FruitFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteItemsProvider = Provider.of<FruitProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Favorite Items"),
      ),
      body: Column(
        children: [
          Expanded(
              child: favoriteItemsProvider.favorite.isEmpty
                  ? const Center(
                      child: Text("No favorite items"),
                    )
                  : ListView.builder(
                      itemCount: favoriteItemsProvider.favorite.length,
                      itemBuilder: (context, index) {
                        final itemIndex = favoriteItemsProvider.favorite[index];
                        final currentItem =
                            favoriteItemsProvider.fruitList[itemIndex];
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        item: currentItem, index: itemIndex),
                                  ));
                            },
                            child: SizedBox(
                              height: 110,
                              child: Card(
                                color: Colors.white,
                                surfaceTintColor: Colors.white,
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 110,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    currentItem["image"]),
                                                fit: BoxFit.cover)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currentItem["name"],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                              width: 120,
                                              child: Text(
                                                currentItem["description"],
                                                maxLines: 2,
                                              )),
                                          const Spacer(),
                                          Text("\$  ${currentItem["price"]}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                        ],
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            favoriteItemsProvider
                                                .removeFavorite(itemIndex);
                                          },
                                          icon: const Icon(Icons.favorite,
                                              color: Colors.teal)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ))
        ],
      ),
    );
  }
}
