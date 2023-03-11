import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Center(child: Text('first App')),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        ), Icon(Icons.exit_to_app)],
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        'asset/images/moshaf.jpg',
                        fit: BoxFit.fill,
                        width: 200,
                        height: 200,
                      ),
                      Text('قران',
                          style: TextStyle(fontSize: 25,color: Colors.purple ),
                      ),],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        'asset/images/azkar.png',
                        fit: BoxFit.fill,
                        width: 200,
                        height: 200,
                      ),
                      Text('اذكار',
                      style: TextStyle(fontSize: 25,color: Colors.purple  ) ,
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'asset/images/tspeh.png',
                    fit: BoxFit.fill,
                    width: 200,
                    height: 200,
                  ),
                  Text('تسبيح',
                      style: TextStyle(fontSize: 25,color: Colors.purple )
                  ),],
              ),
            ],
          )
        ],
      ),
    );
  }
}
