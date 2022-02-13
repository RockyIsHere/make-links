import 'package:flutter/material.dart';
import 'package:make_links/constants/colors.dart';
import 'package:make_links/screens/creator_section.dart';
import 'package:make_links/widgets/book_stager.dart';
import 'package:make_links/widgets/custom_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabIndex = 0;
  var bottomIndex = 0;
  final pageController = PageController();
  List<Widget> screens = [
    const Home(),
    CreatorSection(),
    Container(),
    Container(),
  ];
  List<String> appBarTitle = [
    'All Books',
    'Creator Section',
    'Save Books',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(
        text: appBarTitle[bottomIndex],
      ),
      body: screens[bottomIndex],
      bottomNavigationBar: _buildBottomNegivationBar(),
    );
  }

  AppBar _buildAppbar({required String text}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu_rounded),
        color: kFont,
        iconSize: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(
            color: kFont, fontSize: 18, letterSpacing: 1, wordSpacing: 2),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_rounded),
          color: kFont,
          iconSize: 30,
        ),
      ],
    );
  }

  _buildBottomNegivationBar() {
    final bottoms = [
      Icons.home_outlined,
      Icons.text_snippet_rounded,
      Icons.save_alt_sharp,
      Icons.account_circle,
    ];
    // ignore: non_constant_identifier_names
    final Width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: Width,
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () => setState(() {
            bottomIndex = index;
          }),
          child: Container(
            width: (Width - 40) / 4,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: bottomIndex == index
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: Colors.cyan,
                      ),
                    ),
                  )
                : null,
            child: Icon(
              bottoms[index],
              size: 30,
              color: bottomIndex == index ? kFont : Colors.grey[400],
            ),
          ),
        ),
        itemCount: bottoms.length,
        separatorBuilder: (_, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tabIndex = 0;

  var bottomIndex = 0;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTab(tabIndex, (int index) {
          setState(() {
            tabIndex = index;
          });
          pageController.jumpToPage(index);
        }),
        Expanded(
            child: BookStragerGridView(
          tabIndex,
          pageController,
          (int index) => setState(() {
            tabIndex = index;
          }),
        ))
      ],
    );
  }
}
