import 'package:dio/dio.dart';
import 'package:jaguaribef/app/shared/repositories/interface_product_repository.dart';
import '../../shared/models/product.dart';

class ProductRepository implements IProductRepository{
  final Dio dio;

  ProductRepository(this.dio);
  
  @override
  Future<List<Product>> getAllProducts() async {
    var response = await dio.get('/products');
    List<Product> products = [];
    for (var json in (response.data['data'] as List)) {
      Product product = Product.fromJson(json);
      products.add(product);
    }
    return products;
  }

}