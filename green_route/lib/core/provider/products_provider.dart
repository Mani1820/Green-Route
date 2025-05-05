import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_route/Models/category_model.dart';
import 'package:green_route/Models/product_model.dart';

final List<Products> products = [
  Products(
    id: '1',
    name: 'Lime',
    image: 'Assets/Images/#lime.jpeg.jpg',
    price: 40.0,
    description:
        ' A small, green citrus fruit known for its tangy and refreshing flavor, often used in drinks and cooking.',
    category: 'Fruits',
    farmerName: 'Manikandan',
    farmerLocation: 'Kallipalayam',
    upi: 'manibadboy66-1@oksbi',
  ),
  Products(
    id: '2',
    name: 'Pomogranate',
    image: 'Assets/Images/pomogranate.jpeg.jpg',
    price: 50.0,
    description:
        'A round fruit with a tough outer skin and juicy, ruby-red seeds inside, rich in antioxidants and nutrients.',
    category: 'Fruits',
    farmerName: 'Ram kumar',
    farmerLocation: 'Kallipalayam',
    upi: 'ramkumar1824rs@okaxis',
  ),
  Products(
      id: '3',
      name: 'Starwberry',
      image: 'Assets/Images/strawberry.jpg',
      price: 60.0,
      description:
          'A bright red, heart-shaped fruit with a sweet and slightly tart taste, popular in desserts and smoothies.',
      category: 'Fruits',
      farmerName: 'Yogesh',
      farmerLocation: 'Kovilpalayam',
      upi: 'Yogeshjosh333@okaxis'),
  Products(
      id: '4',
      name: 'dragon fruite',
      image: 'Assets/Images/dragonfruite.jpg',
      price: 1.0,
      description:
          'An exotic fruit with a vibrant pink or yellow skin and white or red flesh speckled with black seeds, mildly sweet and hydrating.',
      category: 'Fruits',
      farmerName: 'Kathir',
      farmerLocation: 'Kovilpalayam',
      upi: 'kathirnarzo3128@okhdfcbank'),
  Products(
      id: '5',
      name: 'Grapes',
      image: 'Assets/Images/#grapes.jpeg.jpg',
      price: 80.0,
      description: 'Fresh and sweet grapes, perfect for snacking or baking.',
      category: 'Fruits',
      farmerName: 'Yogesh',
      farmerLocation: 'Kovilpalayam',
      upi: 'Yogeshjosh333@okaxis'),
  Products(
      id: '6',
      name: 'tomato',
      image: 'Assets/Images/tomato.jpeg.jpg',
      price: 90.0,
      description:
          'Sweet and juicy pineapples, perfect for snacking or baking.',
      category: 'vegetables',
      farmerName: 'kathir',
      farmerLocation: 'Kovilpalayam',
      upi: 'kathirnarzo3128@okhdfcbank'),
  Products(
    id: '7',
    name: 'potato',
    image: 'Assets/Images/#potatoes.jpeg.jpg',
    price: 100.0,
    description: 'Sweet and juicy potatoes, perfect for snacking or baking.',
    category: 'vegetables',
    farmerName: 'Manikandan',
    farmerLocation: 'Kovilpalayam',
    upi: 'manibadboy66-1@oksbi',
  ),
  Products(
    id: '8',
    name: 'onion',
    image: 'Assets/Images/Onion.jpeg.jpg',
    price: 110.0,
    description: 'Sweet and juicy onions, perfect for snacking or baking.',
    category: 'vegetables',
    farmerName: 'Ram kumar',
    farmerLocation: 'Kovilpalayam',
    upi: 'ramkumar1824rs@okaxis',
  ),
  Products(
      id: '9',
      name: 'carrot',
      image: 'Assets/Images/carrot.jpg',
      price: 1.0,
      description: 'Sweet and juicy carrots, perfect for snacking or baking.',
      category: 'vegetables',
      farmerName: 'Yogesh',
      farmerLocation: 'Kovilpalayam',
      upi: 'yogeshjosh333@okaxis'),
  Products(
    id: '10',
    name: 'cauliflower',
    image: 'Assets/Images/#cauliflower.jpeg.jpg',
    price: 130.0,
    description:
        ' Sweet and juicy cauliflower, perfect for snacking or baking.',
    category: 'vegetables',
    farmerName: 'Manikandan',
    farmerLocation: 'Kovilpalayam',
    upi: 'manibadboy66-1@oksbi',
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
