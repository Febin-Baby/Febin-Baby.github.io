import 'package:flutter/material.dart';
import 'package:getx_api_fakestore/api/product/product.dart';
import 'package:google_fonts/google_fonts.dart';

class Singlepage extends StatelessWidget {
  final Product data;
  Singlepage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Image.network(
                      data.image.toString(),
                    ),
                  ),
                  Text('Rs : ${data.price.toString()}',
                      style: GoogleFonts.carlito(
                          fontWeight: FontWeight.bold, fontSize: 23,color: Colors.red)),
                  Text(data.category.toString().toUpperCase()),
                  Text(
                    data.description.toString(),
                    maxLines: 5,
                    style: GoogleFonts.akshar(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total item : ${data.rating!.count.toString()}',
                        style: GoogleFonts.abel(
                          color: Colors.purple,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text('Rating : ${data.rating!.rate.toString()}')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
