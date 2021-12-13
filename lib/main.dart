import 'package:flutter/material.dart';
import './pages/add_todo.dart';
import './pages/todo_list.dart';
import 'package:splashscreen/splashscreen.dart';
import './pages/help.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _isInitialValue = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do',
        home: SplashScreen(
          backgroundColor: Colors.indigo[400],
          image: Image.network(
            'https://media.istockphoto.com/photos/christmas-or-winter-composition-snowflakes-and-red-berries-on-gray-picture-id1285648942?b=1&k=20&m=1285648942&s=170667a&w=0&h=SWKc2PZ8byxHJsPDKb-A0gea2pG2fvH-GiJG6xjd9cw=',
          fit: BoxFit.fill,
          ),
          seconds: 5,
          title: const Text(
            'Welcome..',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          navigateAfterSeconds: Home(),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  bool _isInitialValue = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text("2 Do"),
                centerTitle: true,
                bottom:const  TabBar(
                  labelColor: Colors.white,
                  tabs: [
                    Tab(
                        child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Icon(
                        Icons.add,
                      ),
                    )),
                    Tab(
                        child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Icon(
                        Icons.note,
                      ),
                    )),
                    Tab(
                        child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Icon(
                        Icons.camera,
                      ),
                    )),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  AddTodo(),
                  ListTodos(),
                  Help(),
                ],
              ),
              drawer: Drawer(
                  child: Column(
                children: [
                  const UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Icon(Icons.account_circle_outlined),
                    ),
                    accountEmail: Text('gson of mary'),
                    accountName: Text('G@Nah'),
                  ),
                 const  ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text('Add studet..'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: const Text('List of Studetns'),
                    trailing: const Icon(Icons.account_circle_outlined),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListTodos()),
                      );
                    },
                  ),
                ],
              )),
            )));
  }
}
