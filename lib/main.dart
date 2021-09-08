import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

const kRed = Color(0xffFF0000);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigationBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersistentBottomNavigationBar(),
    );
  }
}

class PersistentBottomNavigationBar extends StatelessWidget {
  PersistentBottomNavigationBar({Key? key}) : super(key: key);

  // コントローラー。初期に選択されているタブのインデックスを引数に指定する。
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  // 表示するスクリーンを返す関数。
  List<Widget> _buildScreens() {
    return [
      const ContentsPage(
        iconData: CupertinoIcons.home,
        text: 'ホーム',
      ),
      const ContentsPage(
        iconData: CupertinoIcons.bell_fill,
        text: 'お知らせ',
      ),
      const ContentsPage(
        iconData: CupertinoIcons.camera,
        text: '出品',
      ),
      const ContentsPage(
        iconData: CupertinoIcons.square_grid_2x2,
        text: '〇〇ペイ',
      ),
      const ContentsPage(
        iconData: CupertinoIcons.profile_circled,
        text: 'マイページ',
      ),
    ];
  }

  // タブの情報を返す関数
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("ホーム"),
        activeColorPrimary: kRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.bell_fill),
        title: ("お知らせ"),
        activeColorPrimary: kRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.camera, color: Colors.white),
        title: ("出品"),
        activeColorPrimary: kRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.square_grid_2x2),
        title: ("〇〇ペイ"),
        activeColorPrimary: kRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("マイページ"),
        activeColorPrimary: kRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        // 表示範囲をデバイスの領域内に限定する
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        // キーボードが表示されたときに画面を上に移動させるかどうか。
        stateManagement: true,
        // 各タブの状態を保持するかどうか。
        hideNavigationBarWhenKeyboardShows: true,
        //  キーボード表示時にナビゲーターを非表示にするか。
        decoration: NavBarDecoration(
          // ナビゲーションバーのデコレーション
          borderRadius: BorderRadius.circular(20.0),
        ),
        itemAnimationProperties: const ItemAnimationProperties(
          // タブ変更時のアニメーションを指定
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // スクリーン移動時のアニメーションを指定
          animateTabTransition: true, // 初期値false。アニメーションさせたいときにtrueにする
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15, // バーの種類を指定
      ),
    );
  }
}

class ContentsPage extends StatelessWidget {
  const ContentsPage({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.grey),
          ),
          ElevatedButton(
              onPressed: () {
                pushNewScreen(context, screen: NewScreen(),  withNavBar: false);
              },
              style: ElevatedButton.styleFrom(primary: kRed),
              child: Text('push new screen'))
        ],
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
