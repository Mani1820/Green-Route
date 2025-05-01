import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_route/Models/category_model.dart';
import 'package:green_route/Models/product_model.dart';

final List<Products> products = [
  Products(
    id: '1',
    name: 'Banana',
    image: 'Assets/Images/#lime.jpeg.jpg',
    price: 40.0,
    description: 'Fresh and ripe bananas, perfect for snacking or baking.',
    category: 'Fruits',
    farmerName: 'John Doe',
    farmerLocation: 'Kallipalayam',
  ),
  Products(
    id: '2',
    name: 'Apple',
    image: 'Assets/Images/pomogranate.jpeg.jpg',
    price: 50.0,
    description: 'Juicy and delicious apples, perfect for snacking or baking.',
    category: 'Fruits',
    farmerName: 'John Doe',
    farmerLocation: 'Kallipalayam',
  ),
  Products(
    id: '3',
    name: 'Mango',
    image: 'Assets/Images/strawberry.jpg',
    price: 60.0,
    description: 'Sweet and juicy mangos, perfect for snacking or baking.',
    category: 'Fruits',
    farmerName: 'John Doe',
    farmerLocation: 'Kovilpalayam',
  ),
  Products(
    id: '4',
    name: 'Orange',
    image: 'Assets/Images/dragonfruite.jpg',
    price: 70.0,
    description: 'Juicy and delicious oranges, perfect for snacking or baking.',
    category: 'Fruits',
    farmerName: 'John Doe',
    farmerLocation: 'Kovilpalayam',
  ),
  Products(
    id: '5',
    name: 'Grapes',
    image: 'Assets/Images/#grapes.jpeg.jpg',
    price: 80.0,
    description: 'Fresh and sweet grapes, perfect for snacking or baking.',
    category: 'Fruits',
    farmerName: 'John Doe',
    farmerLocation: 'Kovilpalayam',
  ),
  Products(
    id: '6',
    name: 'tomato',
    image: 'Assets/Images/tomato.jpeg.jpg',
    price: 90.0,
    description: 'Sweet and juicy pineapples, perfect for snacking or baking.',
    category: 'vegetables',
    farmerName: 'John Doe',
    farmerLocation: 'Kovilpalayam',
  ),
  Products(
    id: '7',
    name: 'potato',
    image: 'Assets/Images/#potatoes.jpeg.jpg',
    price: 100.0,
    description: 'Sweet and juicy potatoes, perfect for snacking or baking.',
    category: 'vegetables',
    farmerName: 'John Doe',
    farmerLocation: 'Kovilpalayam',
  ),
  Products(
    id: '8',
    name: 'onion',
    image: 'Assets/Images/Onion.jpeg.jpg',
    price: 110.0,
    description: 'Sweet and juicy onions, perfect for snacking or baking.',
    category: 'vegetables',
    farmerName: 'John Doe',
    farmerLocation: 'Kovilpalayam',
  ),
  Products(
    id: '9',
    name: 'carrot',
    image: 'Assets/Images/carrot.jpg',
    price: 120.0,
    description: 'Sweet and juicy carrots, perfect for snacking or baking.',
    category: 'vegetables',
    farmerName: 'John Doe',
    farmerLocation: 'Kovilpalayam',
  ),
  Products(
    id: '10',
    name: 'cauliflower',
    image: 'Assets/Images/#cauliflower.jpeg.jpg',
    price: 130.0,
    description:
        ' Sweet and juicy cauliflower, perfect for snacking or baking.',
    category: 'vegetables',
    farmerName: 'John Doe',
    farmerLocation: 'Kovilpalayam',
  ),
];

final allProductProvider = Provider((ref) {
  return products;
});

final fruitesProvider = Provider((ref) {
  return products.where((product) => product.category == 'Fruits').toList();
});

final vegitablesProvider = Provider((ref) {
  return products.where((p) => p.category == 'vegetables').toList();
});

final List categories = [
  Categories(
    id: '1',
    name: 'Fruits',
    imageUrl: 'Assets/Images/fruits.png',
  ),
  Categories(
    id: '2',
    name: 'vegetables',
    imageUrl: 'Assets/Images/Veg.png',
  ),
  Categories(
    id: '3',
    name: 'dairy',
    imageUrl: 'Assets/Images/dairy.png',
  ),
  Categories(
    id: '4',
    name: 'others',
    imageUrl: 'Assets/Images/others.jpg',
  ),
];

final categoryProvider = Provider((ref) {
  return categories;
});
