import 'package:flutter/material.dart';
import 'package:food/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/providers/favorites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded
                      ? 'Meal added to favorites.'
                      : 'Meal removed from favorites.'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.2,
                    end: 1.0,
                  ).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border_outlined,
                key: ValueKey(isFavorite),
              ),
            ),
          )
        ],
        title: Text(
          meal.title,
          style: const TextStyle(fontFamily: 'Roboto', fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(10),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10), // Matching image padding
              child: Wrap(
                spacing: 8.0, // Space between ingredients horizontally
                runSpacing: 8.0, // Space between lines of ingredients
                children: [
                  for (final ingredient in meal.ingredients)
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        child: Text(
                          ingredient,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                children: [
                  for (final step in meal.steps)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 10.0, // Indentation from the left
                      ),
                      child: Text(
                        step,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        textAlign: TextAlign.start, // Ensures left-aligned text
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:food/models/meal.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:food/providers/favorites_provider.dart';



// class MealDetailScreen extends ConsumerWidget {
//   const MealDetailScreen({
//     super.key,
//     required this.meal,
//   });

//   final Meal meal;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final favoriteMeals = ref.watch(favoriteMealsProvider);

//     final isFavorite = favoriteMeals.contains(meal);

//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {
//               final wasAdded = ref
//                   .read(favoriteMealsProvider.notifier)
//                   .toggleMealFavoriteStatus(meal);
//               ScaffoldMessenger.of(context).clearSnackBars();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(wasAdded
//                       ? 'Meal added to favorites.'
//                       : 'Meal removedd from favorites.'),
//                 ),
//               );
//             },
//             icon: AnimatedSwitcher(
//               duration: const Duration(milliseconds: 300),
//               transitionBuilder: (child, animation) {
//                 return ScaleTransition(
//                   scale: Tween<double>(
//                     begin: 0.2,
//                     end: 1.0,
//                   ).animate(animation),
//                   child: child,
//                 );
//               },
//               child: Icon(
//                 isFavorite ? Icons.star : Icons.star_border_outlined,
//                 key: ValueKey(isFavorite),
//               ),
//             ),
//           )
//         ],
//         title: Text(meal.title),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Hero(
//               tag: meal.id,
//               child: Image.network(
//                 meal.imageUrl,
//                 height: 300,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(
//               height: 14,
//             ),
//             Text(
//               'ingredients',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   color: Theme.of(context).colorScheme.primary,
//                   fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 14),
//             for (final ingredients in meal.ingredients)
//               Text(
//                 ingredients,
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onSurface,
//                     ),
//               ),
//             const SizedBox(height: 24),
//             Text(
//               'Steps',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   color: Theme.of(context).colorScheme.primary,
//                   fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 14),
//             for (final step in meal.steps)
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 8,
//                 ),
//                 child: Text(
//                   step,
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         color: Theme.of(context).colorScheme.onSurface,
//                       ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
