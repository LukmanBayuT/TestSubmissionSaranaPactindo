import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productsshop/services/api_services.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({Key? key, required this.id}) : super(key: key);

  int? id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: ApiServices().getDetails(widget.id.toString()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var details = snapshot.data;
            var price = snapshot.data.price.toString();
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(details.image),
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          details.title,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800, fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.stars_rounded,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              details.rating.rate.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Price \$$price',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Category as : ${details.category}',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      details.description,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  )),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
