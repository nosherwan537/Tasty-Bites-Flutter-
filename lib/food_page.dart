import 'package:flutter/material.dart';

class FoodItemsPage extends StatefulWidget {
  @override
  _FoodItemsPageState createState() => _FoodItemsPageState();
}

class _FoodItemsPageState extends State<FoodItemsPage> {
  List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Roll',
      'description': 'A roll is a small, often round loaf of bread served as a meal accompaniment.',
      'quantity': 15,
      'maxQuantity': 20,
      'image': 'https://cliftonnimco.com/wp-content/uploads/2018/04/Chicken-Roll.jpg',
      'price': '100 Rs',
    },
    {
      'name': 'Samosa',
      'description': 'A samosa is a fried or baked pastry with a savory filling, such as spiced potatoes, onions, peas, cheese, beef, and other meats, or lentils.',
      'quantity': 10,
      'maxQuantity': 15,
      'image': 'https://cdn.britannica.com/57/170657-050-C9620E39/Indian-samosa-chutney.jpg',
      'price': '100 Rs',
    },
    {
      'name': 'Kebab',
      'description': 'Kebabs are various cooked meat dishes, with their origins in Middle Eastern cuisine.',
      'quantity': 5,
      'maxQuantity': 10,
      'image': 'https://sinfullyspicy.com/wp-content/uploads/2023/04/1200-by-1200-images-3-2.jpg',
      'price': '100 Rs',
    },
  ];

  void _increaseQuantity(int index) {
    setState(() {
      if (foodItems[index]['quantity'] < foodItems[index]['maxQuantity']) {
        foodItems[index]['quantity']++;
      }
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (foodItems[index]['quantity'] > 0) {
        foodItems[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(foodItems[index]['image']!),
              ListTile(
                title: Text(foodItems[index]['name']!),
                subtitle: Text(foodItems[index]['description']!),
                trailing: Text(foodItems[index]['price']!),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => _increaseQuantity(index),
                  ),
                  Text(foodItems[index]['quantity'].toString()),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => _decreaseQuantity(index),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
