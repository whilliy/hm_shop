import 'package:flutter/material.dart';

class HmMorelist extends StatefulWidget {
  const HmMorelist({super.key});

  @override
  State<HmMorelist> createState() => _HmMorelistState();
}

class _HmMorelistState extends State<HmMorelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 100,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //网格是2列
        mainAxisSpacing: 10, //主轴间距
        crossAxisSpacing: 10, //交叉轴间距
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          width: 200,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            '无限产品滚动列表项${index + 1}',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
