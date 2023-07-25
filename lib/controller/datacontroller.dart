import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_api_fakestore/api/product/product.dart';
import 'package:getx_api_fakestore/dataservices/services.dart';

class Datacontroller extends GetxController {

  var dataLit=<Product>[].obs;
  var loading=true.obs;
  getdata()async{
    var datas =await Services().getProduct();
    loading.value=true;
    try {
      if(datas!=null){
        loading.value=false;
        dataLit.value=datas;
      }
    } catch (e) {
      loading.value=false;
      Get.snackbar('title', '$e');
    }
  }
  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
