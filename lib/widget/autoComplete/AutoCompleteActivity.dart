import 'package:flutter/material.dart';

@immutable
class User {
  final String email;
  final String name;

  User(this.email, this.name);

  @override
  String toString() {
    return '$name, $email';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is User && other.name == name && other.email == email;
  }

  @override
  int get hashCode => Object.hash(email, name);
}

///
class AutoCompleteActivity extends StatelessWidget {
  List<String> options = [
    "Naruto",
    "Sasuke",
    "Sakura",
    "Itachi",
    "Kuruma",
  ];

  List<User> _userOptions = <User>[
    User('Alice', 'alice@example.com'),
    User('Bob', 'bob@example.com'),
    User('Charlie', 'charlie123@gmail.com'),
  ];

  static String _displayStringForOption(User option) => option.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 36, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Autocomplete<String>(
              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return options.where((String option) {
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                debugPrint('You just selected $selection');
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Autocomplete<User>(
              displayStringForOption: _displayStringForOption,
              optionsMaxHeight: 180.0,
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<User>.empty();
                }
                return _userOptions.where((User option) {
                  return option
                      .toString()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              optionsViewBuilder: (context, onSelected, optionSelected) =>
                  Align(
                alignment: Alignment.topLeft,
                child: Material(
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(4.0)),
                  ),
                  child: Container(
                    height: 52.0 * options.length,
                    width: 240.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: optionSelected.toList().length,
                      itemBuilder: (context, index) {
                        var user = optionSelected.toList()[index];
                        return InkWell(
                          onTap: () {
                            print('===> Enter optionsViewBuilder ${user.name}');
                            onSelected(user);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                            color: Colors.blue,
                            child: Text(
                              user.name,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              onSelected: (User selection) {
                print(
                    '===> Enter onSelected ${_displayStringForOption(selection)}');
              },
              fieldViewBuilder: (context, controller, focus, onSubmitted) {
                return TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "hintText", // pass the hint text parameter here
                    hintStyle: TextStyle(color: Colors.blue),
                  ),
                  focusNode: focus,
                  onSubmitted: (String value) {
                    onSubmitted();
                    print('===> Enter onSubmitted ${value}');
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
