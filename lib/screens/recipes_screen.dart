import 'package:flutter/material.dart';
import 'package:hello_flutter/API/fooder_api.dart';
import 'package:hello_flutter/models/sample_recipe.dart';
import 'package:hello_flutter/widgets/grid_recipes.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({Key? key}) : super(key: key);

  final fooderApi = FooderApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SampleRecipe>>(
        future: fooderApi.getSampleRecipes(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemCount: snap.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GridRecipe(srecipe: snap.data![index]);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
