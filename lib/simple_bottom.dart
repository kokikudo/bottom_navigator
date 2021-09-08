import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectIndex = 0;
  final List<Widget> _pages = [
    const ContentsPage(
      iconData: Icons.home,
      text: 'Home',
    ),
    const ContentsPage(
      iconData: Icons.business,
      text: 'Business',
    ),
    const ContentsPage(
      iconData: Icons.school,
      text: 'School',
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.pinkAccent,
        selectedFontSize: 15,
        onTap: _onTap,
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
          )
        ],
      ),
    );
  }
}