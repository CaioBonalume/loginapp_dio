import 'package:flutter/material.dart';
import 'package:loginapp/pages/card_page.dart';
import 'package:loginapp/pages/pageview_2.dart';
import 'package:loginapp/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controllerPageView = PageController(initialPage: 0);
  int posicaoPag = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: controllerPageView,
                  onPageChanged: (value) {
                    setState(() {
                      posicaoPag = value;
                    });
                  },
                  scrollDirection: Axis.vertical,
                  children: const [
                    CardPage(),
                    PageView2(),
                  ]),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controllerPageView.jumpToPage(value);
                },
                currentIndex: posicaoPag,
                items: const [
                  BottomNavigationBarItem(
                      label: 'Home', icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: 'Criar Formulario', icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: 'Pag3', icon: Icon(Icons.delete)),
                ])
          ],
        ),
      ),
    );
  }
}
