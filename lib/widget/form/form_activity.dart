import 'package:explore_widget/widget/form/school.dart';
import 'package:explore_widget/widget/form/user.dart';
import 'package:flutter/material.dart';

import '../../commons/myTitle.dart';

class FormActivity extends StatefulWidget {
  @override
  _FormActivityState createState() => _FormActivityState();
}

class _FormActivityState extends State<FormActivity> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  /// Dropdown value
  String? dropdownString;
  int? dropdownInt;
  School? dropdownSchool;
  School? dropdownSchool2;
  List<School> schools = [
    School(name: "SMANIVA", address: "Lambah"),
    School(name: "SMANSA", address: "Bukitinggi")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
              builder: (context) => Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyTitle("TextFormField"),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'First name'),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      onSaved: (val) =>
                          setState(() => _user.firstName = val ?? ''),
                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Last name'),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your last name.';
                          }
                          return null;
                        },
                        onSaved: (val) =>
                            setState(() => _user.lastName = val ?? '')),

                    ///
                    MyTitle(
                      "DropdownButton",
                      margin: EdgeInsets.only(top: 24),
                    ),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                            child: Text("Naruto"), value: "Naruto"),
                        DropdownMenuItem(child: Text("Luffy"), value: "Luffy"),
                        DropdownMenuItem(child: Text("Goku"), value: "Goku"),
                        DropdownMenuItem(
                            child: Text("Magnum"), value: "Magnum"),
                      ],
                      onChanged: (value) {
                        setState(() {
                          if (value is String) {
                            dropdownString = value;
                          }
                        });
                      },
                      value: dropdownString,
                    ),
                    DropdownButton<int>(
                      hint: Text("Pick"),
                      items: [
                        DropdownMenuItem(child: Text("Naruto"), value: 8),
                        DropdownMenuItem(child: Text("Luffy"), value: 10),
                        DropdownMenuItem(child: Text("Goku"), value: 9),
                        DropdownMenuItem(child: Text("Magnum"), value: 7),
                      ],
                      iconSize: 24.0,
                      iconEnabledColor: Colors.greenAccent,
                      isExpanded: true,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                      onChanged: (value) {
                        setState(() {
                          dropdownInt = value!;
                        });
                      },
                      value: dropdownInt,
                    ),
                    DropdownButton<int>(
                      hint: Text("Disabled"), // If items or onChanged null
                      items: null,
                      onChanged: null,
                    ),
                    DropdownButton<School>(
                      items: schools.map((School value) {
                        return DropdownMenuItem<School>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdownSchool = value;
                        });
                      },
                      value: dropdownSchool,
                    ),

                    MyTitle(
                      "DropdownButtonFormField",
                      margin: EdgeInsets.only(top: 24),
                    ),
                    DropdownButtonFormField<School>(
                      hint: Text("Pick your school"),
                      isExpanded: true,
                      items: schools.map((School value) {
                        return DropdownMenuItem<School>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdownSchool2 = value;
                        });
                      },
                      value: dropdownSchool2,
                      validator: (value) {
                        if (value == null) {
                          return "Please pick your school";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        print("====> Enter value.name: ${value?.name}");
                      },
                    ),

                    ///
                    MyTitle(
                      "Switch",
                      margin: EdgeInsets.only(top: 24),
                    ),
                    SwitchListTile(
                      title: const Text('Monthly Newsletter'),
                      value: _user.newsletter,
                      onChanged: (bool val) =>
                          setState(() => _user.newsletter = val),
                    ),

                    ///
                    MyTitle(
                      "CheckBox",
                      margin: EdgeInsets.only(top: 24),
                    ),
                    CheckboxListTile(
                        title: const Text('Cooking'),
                        value: _user.passions[User.PassionCooking],
                        onChanged: (val) {
                          if (val != null)
                            setState(() =>
                                _user.passions[User.PassionCooking] = val);
                        }),
                    CheckboxListTile(
                        title: const Text('Traveling'),
                        value: _user.passions[User.PassionTraveling],
                        onChanged: (val) {
                          if (val != null)
                            setState(() =>
                                _user.passions[User.PassionTraveling] = val);
                        }),
                    CheckboxListTile(
                        title: const Text('Hiking'),
                        value: _user.passions[User.PassionHiking],
                        onChanged: (val) {
                          if (val != null)
                            setState(
                                () => _user.passions[User.PassionHiking] = val);
                        }),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              final form = _formKey.currentState;
                              if (form?.validate() ?? false) {
                                form!.save();
                                _user.save();
                                _showDialog(context);
                              }
                            },
                            child: Text('Save'))),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  _showDialog(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Submitting form")));
  }
}
