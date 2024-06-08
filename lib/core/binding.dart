import 'package:get/get.dart';
import 'package:rental/controller/home_page_view_model.dart';


class GetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageViewModel());
  }
}
