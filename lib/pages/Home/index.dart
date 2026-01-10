import 'package:flutter/cupertino.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChidren() {
    return [
      //包裹普通Widget的Silver家族的组件
      SliverToBoxAdapter(child: HmSlider()), //轮播图组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), //放上一个SizedBox来搞个间隙
      //放置分类
      //SilverGrid,SliverList只能纵向排列
      //所以还是用ListView，所以在 HmCategory 还是放ListView
      SliverToBoxAdapter(child: HmCategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //推荐
      SliverToBoxAdapter(child: HmSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 10,
          ), //用Padding包裹，使Flex有内边距
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      //增加间距
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMorelist(),
      //
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // Sliver 家族的内容
      slivers: _getScrollChidren(),
    );
  }
}
