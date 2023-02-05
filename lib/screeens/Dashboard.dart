import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health App'),
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                constraints: BoxConstraints.expand(height: 50),
                child: TabBar(
                  labelColor: Colors.white,
                  tabs: [
                    Tab(text: 'Last Night'),
                    Tab(text: 'This Week'),
                    Tab(text: 'This Month'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    LastNightPage(),
                    ThisWeekPage(),
                    ThisMonthPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LastNightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Last Night', style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 20),
          Text('Hours of Sleep: 7 hours'),
          SizedBox(height: 20),
          Text('Heart Rate: 72 bpm'),
        ],
      ),
    );
  }
}

class ThisWeekPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('This Week', style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 20),
          Text('Hours of Sleep: 49 hours'),
          SizedBox(height: 20),
          Text('Heart Rate: 68 bpm'),
        ],
      ),
    );
  }
}

class ThisMonthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('This Month', style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 20),
          Text('Hours of Sleep: 140 hours'),
          SizedBox(height: 20),
          Text('Heart Rate: 70 bpm'),
        ],
      ),
    );
  }
}
