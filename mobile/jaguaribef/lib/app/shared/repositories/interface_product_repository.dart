import '../../shared/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getAllProducts();
}