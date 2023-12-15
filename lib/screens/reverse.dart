import 'package:flutter/material.dart';

class Reverse extends StatefulWidget {
  const Reverse({super.key});

  @override
  State<Reverse> createState() => _ReverseState();
}

class _ReverseState extends State<Reverse> {
  TextEditingController reverseController  = TextEditingController();
  String data = "Hello";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},
      tooltip: "add",
        child:const  Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              tooltip: "Search",
              onPressed: (){}, icon: const Icon(Icons.search))
        ],
        title: const Text("Reverse"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              controller: reverseController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.red, width: 2),)
              ),
            ),
             Text(data),
            ElevatedButton(
                onPressed: (){
              if(reverseController.text.isNotEmpty){
                _reverse(reverseController.text);
              }
            }, child: const Text("Reverse"))
          ],
        ),
      ),
    );
  }
}


String _reverse(String  reverse) {
  return reverse.split('').reversed.join();
}
