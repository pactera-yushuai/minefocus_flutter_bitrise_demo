import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'home_page.dart';

class MainTabPage extends StatelessWidget {
  Worker noticeWorker;

  final List<String> urlList = [
    'https://www.scsk.jp/product/index.html',
    'https://www.scsk.jp/case/index.html',
    'https://www.scsk.jp/corp/index.html',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainTabController>(
      init: MainTabController(),
      dispose: (state) {
        noticeWorker.dispose();
      },
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            body: MFIndexStack(
              itemCount: controller.tabList.length,
              index: controller.tabIndex.value,
              currentItem: (ctx, index) {
                return HomePage(url: urlList[index]);
              },
            ),
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: Colors.white,
              items: controller.tabList.map((tab) {
                bool isSelected = controller.tabList.indexOf(tab) == controller.tabIndex.value;
                return BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: isSelected ? Colors.red : Colors.grey),
                  title: Text(
                    tab.title,
                    style: TextStyle(color: isSelected ? Colors.red : Colors.grey, fontSize: 12.0),
                  ),
                );
              }).toList(),
              onTap: (index) {
                controller.tabIndexChange(index);
              },
            ),
          );
        });
      },
    );
  }
}

class MainTabModel {
  String title;
  String iconName;

  MainTabModel({
    this.title,
    this.iconName,
  });
}

class MainTabController extends GetxController {
  var tabIndex = 0.obs;

  List<MainTabModel> tabList;

  @override
  void onInit() {
    tabList = [
      MainTabModel(
        title: '製品・サービス',
        iconName: 'R.assetsImagesTabbarHome',
      ),
      MainTabModel(
        title: 'お客様事例',
        iconName: 'R.assetsImagesTabbarHome',
      ),
      MainTabModel(
        title: '企業情報',
        iconName: 'R.assetsImagesTabbarHome',
      ),
    ];
    super.onInit();
  }

  @override
  void onClose() {
    tabIndex.close();
    super.onClose();
  }

  void tabIndexChange(int index) {
    if (tabIndex.value != index) {
      tabIndex.value = index;
    }
  }
}

typedef MFIndexStackComplete = Widget Function(BuildContext context, int index);

class MFIndexStack extends StatefulWidget {
  final int index;
  final int itemCount;
  final MFIndexStackComplete currentItem;

  MFIndexStack({Key key, this.index, this.itemCount, this.currentItem}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MFIndexStackState();
}

class _MFIndexStackState extends State<MFIndexStack> {
  List<Widget> items = List();

  @override
  void initState() {
    super.initState();
    if (items.length == 0) {
      for (int i = 0; i < widget.itemCount; i++) {
        items.add(SizedBox(
          key: Key(i.toString()),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (items[widget.index].key == Key(widget.index.toString())) {
      items[widget.index] = widget.currentItem(context, widget.index);
    }
    return IndexedStack(
      index: widget.index,
      children: items,
    );
  }
}
