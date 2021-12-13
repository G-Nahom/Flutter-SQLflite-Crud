import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import './db.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddTodo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTodo();
  }
}

class _AddTodo extends State<AddTodo> {
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController address = TextEditingController();
  //test editing controllers for form
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  MyDb mydb = new MyDb();

  @override
  void initState() {
    getOpendDB();
    super.initState();
  }

  getOpendDB() async{
    await  mydb.open();
  }
  String picedk_date='';
   showDateandTimePicker(BuildContext context) {

        return DateTimePicker(
          style: TextStyle(
              color:Colors.white
          ),
          cursorColor: Colors.yellow,
          cursorRadius: Radius.circular(5.0),
          cursorWidth: 10.0,

          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(

                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(width: 3,color: Colors.white),
              ),
              hintText: "Todo ",
              hintStyle: TextStyle(color:Colors.yellow),
              labelStyle: TextStyle(color:Colors.yellow),
              focusColor: Colors.yellow,
              labelText: "Todo  ",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40)
              )
          ),
          //controller: address,
          type: DateTimePickerType.dateTime,
          dateMask: 'd MMM, yyyy  HH:MM',
          initialValue: DateTime.now().toString()+TimeOfDay.now().toString(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          icon: Icon(Icons.event),
          dateLabelText: 'Date',

          timeLabelText: "Hour",
          selectableDayPredicate: (date) {
            // Disable weekend days to select from the calendar
            if (date.weekday == 6 || date.weekday == 7) {
              return false;
            }

            return true;
          },
          onChanged: (val){
            setState(() {
              picedk_date=val.toString();
            });
          },
          validator: (val) {
            print(val);
            return null;
          },
          onSaved: (val) => print(val),
        );


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            padding:const  EdgeInsets.only(top: 4),
            child: Card(
                child: Stack(
                  children: [
                   Container(
                    height:400,
                     width: MediaQuery.of(context).size.width,
                     child: CarouselSlider.builder(
                    itemCount: imgList.length,
                       itemBuilder: (ctx, index, realIdx) {
                         return Container(
                           child: Image.network(
                             imgList[index],
                             fit: BoxFit.fill,
                             // height:MediaQuery.of(context).size.height,
                           ),
                         );
                       },
                       options: CarouselOptions(
                         aspectRatio: 0.8,
                         enlargeCenterPage: true,
                         autoPlay: true,
                       ),
                ),
                   ),
                        Container(
                         width: MediaQuery.of(context).size.width-20,
                          decoration: BoxDecoration(
                            //color: const Color(0xff7c94b6),

                            border: Border.all(
                              color: Colors.black,
                              width: 8,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width:MediaQuery.of(context).size.width/1.4,
                                child:Column(
                                  children: [
                                    TextField(
                                      controller: name,
                                      style: TextStyle(
                                         color:Colors.white
                                      ),
                                      cursorColor: Colors.yellow,
                                      cursorRadius: Radius.circular(5.0),
                                      cursorWidth: 10.0,

                                      decoration: InputDecoration(
                                          focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                            borderSide: BorderSide(width: 3,color: Colors.white),
                                          ),
                                          hintText: "Todo ",
                                          hintStyle: TextStyle(color:Colors.yellow),
                                          labelStyle: TextStyle(color:Colors.yellow),
                                          focusColor: Colors.yellow,
                                          labelText: "Todo  ",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(40)
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: rollno,
                                      style: TextStyle(
                                          color:Colors.white
                                      ),
                                      cursorColor: Colors.yellow,
                                      cursorRadius: Radius.circular(5.0),
                                      cursorWidth: 10.0,

                                      decoration: InputDecoration(
                                          focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                            borderSide: BorderSide(width: 3,color: Colors.white),
                                          ),
                                          hintText: "Todo No",
                                          hintStyle: TextStyle(color:Colors.yellow),
                                          labelStyle: TextStyle(color:Colors.yellow),
                                          focusColor: Colors.yellow,
                                          labelText: "Todo  No ",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(40)
                                          )
                                      ),

                                    ),
                                    const SizedBox(height:20),
                                    showDateandTimePicker(context),
                                    const SizedBox(
                                      height: 20,
                                    ),


                                    const SizedBox(height: 20,),


                                    FloatingActionButton.extended(
                                      icon: Icon(Icons.save),
                                      backgroundColor: Colors.indigo,
                                      label: Text('Save'),
                                      onPressed: () {
                                        print('controller values...' +
                                            address.text +
                                            'with value' +
                                            address.value.text);
                                        //mydb.open();
                                        mydb.db!.rawInsert(
                                            "INSERT INTO Todos (name, roll_no, address) VALUES (?, ?, ?);",
                                            [
                                              name.value.text,
                                              rollno.value.text,
                                              picedk_date
                                            ]); //add Todo from form to database

                                        Toast.show('Saved Success', context,
                                            duration: Toast.LENGTH_LONG,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            gravity: Toast.CENTER);
                                        name.text = "";
                                        rollno.text = "";
                                        address.text = "";
                                        //clear form to empty after adding data
                                      },
                                    ),
                                  ],
                                )
                              )
                            ],
                          ),
                    )
                  ],
                )
            )
      ),
    );
  }
}
