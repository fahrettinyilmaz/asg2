import 'package:asg2/model/user.dart';
import 'package:asg2/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('assignment 2 '),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            return buildContainer(user);
          }),
    );
  }

  Container buildContainer(User user) {
    final imageUrl = 'https://avatars.dicebear.com/v2/avataaars/' +
        user.username +
        '.svg?options[mood][]=happy';
    return Container(
        margin: EdgeInsets.fromLTRB(14, 30, 14, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey),
        width: 330,
        height: 170,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: SvgPicture.network(imageUrl),
              ),
              flex: 3,
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(minWidth: 220),
                      child: Text(
                        user.name,
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70),
                    ),
                    Container(
                      child: Row(
                        children: [Icon(Icons.phone), Text(user.phone)],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [Icon(Icons.mail), Text(user.email)],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text(user.fullAddress)
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [Icon(Icons.work), Text(user.company.name)],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70),
                    ),
                  ]),
              flex: 5,
            )
          ],
        ));
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
