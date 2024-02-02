class Product {
  final String productID;
  final String productName;
  final String brandName;
  final double price;
  final DateTime expiryDate;

  Product({
    required this.brandName,
    required this.expiryDate,
    required this.price,
    required this.productID,
    required this.productName,
  });

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
        brandName: data['brand_name'],
        expiryDate: data['expiry_date'],
        price: data['price'],
        productID: data['product_id'],
        productName: data['product_name']);
  }
}
