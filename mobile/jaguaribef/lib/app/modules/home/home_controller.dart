import 'package:jaguaribef/app/shared/models/product.dart';
import 'package:jaguaribef/app/shared/repositories/interface_product_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IProductRepository repository;

  _HomeControllerBase(this.repository) {
    fetchProducts();
  }

  @observable
  ObservableFuture<List<Product>> products;

  
  @action
  fetchProducts() {
    products = repository.getAllProducts().asObservable();
  }

}
