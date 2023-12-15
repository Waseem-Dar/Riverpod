import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Provider/fruit_screen.dart';
import 'package:new_project/Provider/value_notifier.dart';
import 'package:new_project/Riverpod/example/posts_screeen.dart';
import 'package:new_project/screens/portfolio.dart';
import 'package:new_project/screens/responsive.dart';
import 'package:new_project/screens/reverse.dart';
import 'package:provider/provider.dart';
import 'Provider/all_provider.dart';
import 'Riverpod/future_provider.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

   late Size mq ;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) =>  CountProvider(),),
    //     ChangeNotifierProvider(create: (context) =>  SliderProvider(),),
    //     ChangeNotifierProvider(create: (context) =>  FavoriteProvider(),),
    //     ChangeNotifierProvider(create: (context) =>  DarkThemeProvider(),),
    //     ChangeNotifierProvider(create: (context) =>  FruitProvider(),),
    //   ],
    //   child: Builder(
    //     builder: (context) {
    //       final themeChanger = Provider.of<DarkThemeProvider>(context);
            return  const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            // themeMode: themeChanger.themeMode,
            // darkTheme: ThemeData(
            //   brightness: Brightness.dark,
            //    appBarTheme:const AppBarTheme(backgroundColor: Colors.green),
            //   iconTheme:const IconThemeData(color: Colors.amber),
            //
            // ),
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   useMaterial3: true,
            // ),
            home: PortFolio(),

          );
        }
      // ),
    // );
  // }
}


