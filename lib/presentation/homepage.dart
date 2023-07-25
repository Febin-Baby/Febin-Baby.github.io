import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_fakestore/controller/datacontroller.dart';
import 'package:getx_api_fakestore/presentation/singlepage.dart';

class HomePAge extends StatelessWidget {
  HomePAge({super.key});

  //Create instance of controller
  final controler = Get.put(Datacontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Obx(() {
          return controler.loading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.builder(
                    gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 2,
                      // crossAxisSpacing: 12.0,
                      // mainAxisSpacing: 8.0,
                    ),
                    itemCount: controler.dataLit.length,
                    itemBuilder: (context, index) {
                      final data = controler.dataLit[index];
                      return InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Singlepage(data: data),)),
                        child: Column(
                          children: [
                            Text(data.id.toString()),
                            SizedBox(
                              height: 200,
                              child: Image.network(
                                data.image.toString(),
                              ),
                            ),
                            //const SizedBox(height: 20),
                            Text(data.category.toString().toUpperCase()),
                            Text(
                              'Rate :' ' ${data.price}',
                              style: const TextStyle(color: Colors.red),
                            ),
                            Text(data.description.toString(), maxLines: 3),
                            Text(data.rating!.rate.toString())
                          ],
                        ),
                      );
                    },
                  ),
                );
        }),
      ),
    );
  }
}
