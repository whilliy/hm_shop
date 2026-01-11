//每一个轮播图的具体类型
class BannerItem {
  final String id;
  final String imgUrl;

  BannerItem({required this.id, required this.imgUrl});

  //扩展一个工厂函数，一般用factory来声明一般用来创建示例对象
  factory BannerItem.fromJSON(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? "", imgUrl: json['imgUrl'] ?? "");
  }
}
