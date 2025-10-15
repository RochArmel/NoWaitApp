import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher un restaurant ou un plat',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text('Distance')),
                Chip(label: Text('Popularité')),
                Chip(label: Text('Note')),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Restaurants à proximité',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  RestaurantCard(
                    name: 'Le Bistro',
                    cuisine: 'Cuisine française',
                    rating: 4.5,
                    deliveryTime: '25-35 min',
                    distance: '1.2 km',
                    imageUrl: '', // Placeholder
                  ),
                  RestaurantCard(
                    name: 'Sushi Express',
                    cuisine: 'Cuisine japonaise',
                    rating: 4.2,
                    deliveryTime: '15-25 min',
                    distance: '0.8 km',
                    imageUrl: '', // Placeholder
                  ),
                  RestaurantCard(
                    name: 'Pizza Palace',
                    cuisine: 'Cuisine italienne',
                    rating: 4.8,
                    deliveryTime: '20-30 min',
                    distance: '1.5 km',
                    imageUrl: '', // Placeholder
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

class RestaurantCard extends StatelessWidget {
  final String name;
  final String cuisine;
  final double rating;
  final String deliveryTime;
  final String distance;
  final String imageUrl;

  const RestaurantCard({
    super.key,
    required this.name,
    required this.cuisine,
    required this.rating,
    required this.deliveryTime,
    required this.distance,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey[200],
              child: const Center(
                child: Text('Image'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(cuisine),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text('$rating'),
                      const SizedBox(width: 8),
                      Text(deliveryTime),
                      const SizedBox(width: 8),
                      Text(distance),
                    ],
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