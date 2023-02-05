import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => new ProfileState();
}

class ProfileState extends State<Profile> {
  late double screenHeight;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    final nameController = TextEditingController();
    final interestsController = TextEditingController();
    final skillsController = TextEditingController();

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xfffff8d1),
          body: Container(
              padding: const EdgeInsets.all(20.0),
              color: Color(0xfffff8d1),
              child: new SingleChildScrollView(
                child: new ConstrainedBox(
                  constraints: new BoxConstraints(),
                  child: new Container(
                    child: new Center(
                      child: new Column(
                        children: [
                          new CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                            radius: 60,
                          ),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            controller: nameController,
                            decoration: new InputDecoration(
                              labelText: "Name",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (val) {
                              if (val!.length == 0) {
                                return "Name can not be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Contact Number",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (val) {
                              if (val!.length == 0) {
                                return "Contact number cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          DropDownButtonGender(
                            key: null,
                          ),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          // Column(
                          //     crossAxisAlignment: CrossAxisAlignment.stretch,
                          //     children: [DropDownButtonStack()]),
                          // new Padding(padding: EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Weight",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (val) {
                              if (val!.length == 0) {
                                return "This field can not be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.url,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Height",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            validator: (val) {
                              if (val!.length == 0) {
                                return "This field can not be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.url,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),

                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 50,
                            child: Container(
                              color: Color(0xffddeafb),
                              child: ElevatedButton(
                                  child: Text(
                                    'Save',
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))),
    );
  }
}

class DropDownButtonGender extends StatefulWidget {
  DropDownButtonGender({Key? key}) : super(key: key);

  @override
  _DropDownButtonGenderState createState() => _DropDownButtonGenderState();
}

class _DropDownButtonGenderState extends State<DropDownButtonGender> {
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Male', 'Female', 'Others']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.black54)),
        );
      }).toList(),
    );
  }
}
