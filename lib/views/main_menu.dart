import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productsshop/controllers/product_controller.dart';
import 'package:productsshop/views/product_details.dart';
import 'package:productsshop/views/widget/tile_model.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTitle(),
              createGridView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return SizedBox(
      width: Get.width,
      height: Get.height / 10,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Shop Insider',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: Colors.grey[600],
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_shopping_cart_sharp,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
  }

  Widget createGridView() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          itemCount: productController.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Get.to(() => ProductDetailsScreen(
                      id: productController.productList[index].id!));
                },
                child: ProductTile(productController.productList[index]));
          },
        );
      }),
    );
  }
}
