import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int indexTab = 0;

  @override
  void initState() {
    indexTab = 0;
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: Text('TabBar Demo'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          indicatorWeight: 5.0,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.shopping_basket),
              text: 'Shopping',
            ),
            Tab(
              icon: Icon(Icons.shopping_cart),
              text: 'Cart',
            ),
            Tab(
              icon: Icon(Icons.chat),
              text: 'Chat',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Profile',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics:
            NeverScrollableScrollPhysics(), //para nao trocar de pagina arrastando ao lado
        children: [
          centerIndicatorPage('Home', Icons.home),
          centerIndicatorPage('Shopping', Icons.shopping_basket),
          centerIndicatorPage('Cart', Icons.shopping_cart),
          centerIndicatorPage('Chat', Icons.chat),
          centerIndicatorPage('Profile', Icons.person),
        ],
      ),
    );
  }

  Widget centerIndicatorPage(
    String text,
    IconData icon,
  ) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
