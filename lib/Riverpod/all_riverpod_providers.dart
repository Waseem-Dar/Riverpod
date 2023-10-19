import 'package:flutter_riverpod/flutter_riverpod.dart';

                                                // SimpleProvider
final stringProvider = Provider<String>((ref){
return "Divya";
});


                                                // Future Provider
final futureProvider = FutureProvider<String>((ref) => getWeather() );

Future<String> getWeather()async{
 return await Future.delayed(const Duration(seconds: 5),() {
    return "33 %";
  },);
}

                                                    // Stream, provider
 final streamProvider = StreamProvider<int>((ref){
return counting() ;
});

Stream<int> counting(){
  return  Stream.periodic(const Duration(seconds: 1),(number) => number++,);
}
