import 'package:flutter/material.dart';

import 'package:hello_flutter/models/sample_recipe.dart';
import 'package:hello_flutter/models/theme.dart';

class GridRecipe extends StatelessWidget {
  const GridRecipe({
    Key? key,
    required this.srecipe,
  }) : super(key: key);

  final SampleRecipe srecipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage(srecipe.dishImage),
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              srecipe.title,
              style: FooderTheme.lightTextTheme.bodyText1,
            ),
            Text(
              srecipe.duration,
              style: FooderTheme.lightTextTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
