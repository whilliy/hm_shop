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
  final CarouselSliderController _controller =
      CarouselSliderController(); //控制轮播图跳转的控制器
  int _currentIndex = 0;
  //轮播图
  Widget _getSlider() {
    //在Flutter中获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width;
    //返回轮播图插件
    //根据数据渲染的不同的轮播选项
    return CarouselSlider(
      carouselController: _controller,
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
        //autoPlayInterval: Duration(seconds: 5),
        onPageChanged: (index, reason) {
          _currentIndex = index;
          setState(() {});
        },
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

  Widget _getDots() {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index) {
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
              child:AnimatedContainer( //这里从Container换成了动画Container，当容器的属性发生变化的时候，自动实现动画效果 （设置 duration） 属性
                duration: Duration(microseconds: 300),
                height: 6,
                width: index == _currentIndex ? 40 : 20, //选中的时候宽度是40，否则宽度是20
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.3), //根据是否选中显示不同的颜色（和宽度见上）
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 放Stack，然后里面放上轮播图 搜索框 指示灯导航
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);

    // return Container(
    //   alignment: Alignment.center,
    //   height: 300,
    //   color: Colors.blue,
    //   child: Text('轮播图', style: TextStyle(color: Colors.white, fontSize: 20)),
    // );
  }
}
