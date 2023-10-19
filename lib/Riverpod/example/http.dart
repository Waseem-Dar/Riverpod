import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart ' as http;
import 'model.dart';


class   GetPosts{

  Future<List<Posts>> getPosts()async{
    List<Posts> postsList = [] ;
    try{
      http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts")) ;
      if(response.statusCode == 200){
        final List<dynamic> data =  jsonDecode(response.body);
        for (var item in data){
          Posts post = Posts.fromMap(item);
          postsList.add(post);
        }
      }
    }catch (e){
      log(e.toString());
    }
    return postsList;
}
}