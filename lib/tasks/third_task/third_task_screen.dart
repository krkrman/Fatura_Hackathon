import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/presentation/screens/popular_screen.dart';
import 'package:hackathon_fatura/tasks/third_task/presentation/screens/top_rated_screen.dart';

/* Create a movie mobile application that get popular And recent movies
with an ability to add movie to Favourite list that will be offline
storage on device (use any way you want) that will be displayed
in favorite tabs

- design of this app is attached in project folder
- Adding a progress indicator when information is loading
- Deal with errors coming from the backend (because eventually it will happen!)
- Create model objects for the API data retrieved to avoid working with dynamic (serialisation/deserialisation?)
- Add some sort of state management to show how that is done (InheritedWidget, Provider, GetIt, Mobx and so on)
- add pagination mechanism
 */
class ThirdTaskScreen extends StatefulWidget {
  @override
  _ThirdTaskScreenState createState() => _ThirdTaskScreenState();
}

class _ThirdTaskScreenState extends State<ThirdTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "POPULAR",
              ),
              Tab(text: "TOP RATED"),
              Tab(text: "Favourite"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PopularScreen(),
            TopRatedScreen(),
            Center(child: Text("Page 2")),
          ],
        ),
      ),
    );
  }
}
