class Products {
  const Products(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      this.category,
      this.farmerName,
      this.farmerLocation,
      this.rating,
      this.stock,
      required this.upi});

  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String? category;
  final String? farmerName;
  final String? farmerLocation;
  final double? rating;
  final int? stock;
  final String upi;
}
