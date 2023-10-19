
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Riverpod/example/http.dart';
import 'package:new_project/Riverpod/example/model.dart';

abstract class PostState{}

class InitialState extends PostState{}

class LoadingState extends PostState{}

class LoadedState extends PostState{
  final List listPosts ;
  LoadedState(this.listPosts);
}

class ErrorState extends PostState{
  final String errorMessage;

  ErrorState(this.errorMessage);
}

final postsProvider = StateNotifierProvider<PostsNotifier,PostState>((ref) => PostsNotifier());


class PostsNotifier extends StateNotifier<PostState>{
  PostsNotifier() : super(InitialState());
final GetPosts _getPosts = GetPosts();

  void fetchStats()async{
  try{
    state = LoadingState();
    List<Posts>  posts = await _getPosts.getPosts();
    state = LoadedState(posts);
  }catch (e){
    state = ErrorState(e.toString());
  }
  }
}