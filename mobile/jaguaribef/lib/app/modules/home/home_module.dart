import 'package:dio/dio.dart';
import 'package:jaguaribef/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jaguaribef/app/modules/home/home_page.dart';
import 'package:jaguaribef/app/shared/repositories/concrete_product_repository.dart';
import 'package:jaguaribef/app/shared/repositories/interface_product_repository.dart';
import 'package:jaguaribef/app/shared/utils/constants.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<ProductRepository>())),
        Bind<IProductRepository>((i) => ProductRepository(i.get())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
