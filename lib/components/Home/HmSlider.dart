import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  //轮播图
  Widget _getSlider() {
    //在Flutter中获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width;
    //返回轮播图插件
    //根据数据渲染的不同的轮播选项
    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          //将图片宽度设置为屏幕宽度
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10, //距离Stack顶部的距离
      left: 0,
      right: 0, //同时设置left&right=0，将位于Stack中的子组件的长度拉伸
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 50,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 放Stack，然后里面放上轮播图 搜索框 指示灯导航
    return Stack(children: [_getSlider(), _getSearch()]);

    // return Container(
    //   alignment: Alignment.center,
    //   height: 300,
    //   color: Colors.blue,
    //   child: Text('轮播图', style: TextStyle(color: Colors.white, fontSize: 20)),
    // );
  }
}
