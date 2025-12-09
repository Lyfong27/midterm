import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _CurrentIndex = 0;

  final List<Widget> _Screens = [HomePage(), SecondScreen(), ThirdScreen()];

  // Function to switch tabs
  void changeTab(int index) {
    setState(() {
      _CurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display active screen
      body: _Screens[_CurrentIndex],

      bottomNavigationBar: Material(
        elevation: 12,
        shadowColor: Colors.black.withOpacity(0.5),
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: _CurrentIndex,
          onTap: changeTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // Stretch the content to fill the screen (important for Expanded to work fully)
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Changed fit to BoxFit.cover for a more 'full' look
          Expanded(
            child: Image.asset(
              'assets/image1.png',
              fit: BoxFit.cover, // <--- **Change is here**
            ),
          ),

          Padding(
            // Added Padding to the non-image content for better appearance
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'First Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              bottom: 40.0,
              left: 10.0,
              right: 10.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                final homeState = context
                    .findAncestorStateOfType<_HomeScreenState>();
                homeState?.changeTab(1);
              },
              child: Text(
                'Go to Second Page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Changed fit to BoxFit.cover for a more 'full' look
          Expanded(
            child: Image.asset(
              'assets/image2.png',
              fit: BoxFit.cover, // <--- **Change is here**
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Second Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              bottom: 40.0,
              left: 16.0,
              right: 16.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                final homeState = context
                    .findAncestorStateOfType<_HomeScreenState>();
                homeState?.changeTab(2);
              },
              child: Text(
                'Go to Third Page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Changed fit to BoxFit.cover for a more 'full' look
          Expanded(
            child: Image.asset(
              'assets/image3.png',
              fit: BoxFit.cover, // <--- **Change is here**
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Third Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              bottom: 40.0,
              left: 16.0,
              right: 16.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                final homeState = context
                    .findAncestorStateOfType<_HomeScreenState>();
                homeState?.changeTab(0);
              },
              child: Text(
                'Back to Home Scren',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
