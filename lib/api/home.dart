import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  return (await dioRequest.get(HttpConstans.BANNER_LIST) as List).map((item) {
    return BannerItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}