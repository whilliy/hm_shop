import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  const HmCategory({super.key});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    //return ListView
    //返回一个横向滚动的组件，而这里返回的组件需要可以设置高度，而ListView不能设置高度，所以这里返回一个SizedBox?
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,//横向排列
        itemBuilder:
            (builderContext, index) // 为什么使用 builder？因为它是按需渲染
            {
              return Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 80,
                //height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10), //横向 margin 为10
                child: Text(
                  '分类${index + 1}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
      ),
    );
  }
}
