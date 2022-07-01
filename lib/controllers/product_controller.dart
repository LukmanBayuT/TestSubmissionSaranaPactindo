import 'package:get/get.dart';
import 'package:productsshop/models/product_models.dart';
import 'package:productsshop/services/api_services.dart';

class ProductController extends GetxController {
  var productList = <Products>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void getProduct() async {
    try {
      isLoading(true);
      var products = await ApiServices().getProduct();
      productList.value = products;
    } finally {
      isLoading(false);
    }
  }
}
