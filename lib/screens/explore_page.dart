import 'package:flutter/material.dart';
import 'package:hello_flutter/API/fooder_api.dart';
import 'package:hello_flutter/models/explore_data.dart';
import 'package:hello_flutter/widgets/friend_post_list_view.dart';
import 'package:hello_flutter/widgets/recipes_of_day.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);
  final fooderApi = FooderApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExploreData>(
      future: fooderApi.getExploreData(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          return ListView(
            children: [
              RecipesOfTheDay(recipes: snap.data?.recipesData ?? []),
              const SizedBox(height: 16),
              FriendPostListView(friendPosts: snap.data?.friendsFeed ?? []),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
