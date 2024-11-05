import 'package:flutter/material.dart';

import 'package:food/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    // required this.index,
    required this.onSelectCategory,
  });

  final Category category;
  final void Function() onSelectCategory;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor, // tapping effect
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.8), // 0.55 is the opacity
            category.color.withOpacity(0.6), // 0.9 is the opacity
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            // shadows: [
            //   const Shadow(
            //     offset: Offset(1.0, 1.0),
            //     blurRadius: 2.0,
            //     color: Colors.black,
            //   ),
            // ],
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
