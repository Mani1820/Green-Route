class FarmerProductModel {
  const FarmerProductModel({
    required this.id,
    required this.name,
     this.image,
    required this.price,
    required this.description,
     this.category,
    required this.farmerLocation,
  });
  final String id;
  final String name;
  final String? image;
  final double price;
  final String description;
  final String? category;

  final String farmerLocation;
}
