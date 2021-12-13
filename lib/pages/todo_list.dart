import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './db.dart';
import './update_todo.dart';

class ListTodos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListTodos();
  }
}

class _ListTodos extends State<ListTodos> {
  List<Map> slist = [];
  MyDb mydb = new MyDb();

  @override
  void initState() {
    mydb.open();
    getdata();
    super.initState();
  }

  getdata() {
    Future.delayed(Duration(milliseconds: 500), () async {
      //use delay min 500 ms, because database takes time to initilize.
      slist = await mydb.db!.rawQuery('SELECT * FROM Todos');

      setState(() {}); //refresh UI after getting data from table.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child:Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                boxShadow:[
                  BoxShadow(
                      blurRadius: 10,
                      offset: Offset(5,10),
                      color: Colors.indigo

                  )
                ],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    style: BorderStyle.solid
                )
            ),
            child:  Stack(

              children: [
                Container(

                    height: MediaQuery.of(context).size.height-300,
                    child: Image.asset('assets/images/woriking.png',
                      fit: BoxFit.fill,

                    )
                ),
                Container(
                  child: slist.length == 0
                      ? Center(child: CircularProgressIndicator(),)
                      : //show message if there is no any Todo
                  Column(
                    //or populate list to Column children if there is Todo data.
                    children: slist.map((stuone) {
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.people),
                          title: Text(stuone["name"]),
                          subtitle: Text("Todo No:" +
                              stuone["roll_no"].toString() +
                              ", Date: " +
                              stuone["address"]),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return EditTodo(
                                              rollno: stuone["roll_no"]);
                                        })); //navigate to edit page, pass Todo roll no to edit
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () async {
                                    await mydb.db!.rawDelete(
                                        "DELETE FROM Todos WHERE roll_no = ?",
                                        [stuone["roll_no"]]);
                                    //delete Todo data with roll no.
                                    print("Data Deleted");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                            Text("Todo Data Deleted")));
                                    getdata();
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red))
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          )
          ),
    );
  }
}
