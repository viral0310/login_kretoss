import 'package:first_project/Screens/Verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../Colors/Colors.dart';
import '../custom/texts.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

TextEditingController phoneController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginscreenState extends State<Loginscreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  String? _selected;
  List<Map> _myJson = [
    {'id': '1', 'image': 'images/india.png', 'name': 'INDIA'},
    {'id': '2', 'image': 'images/canada.png', 'name': 'CANADA'},
    {'id': '3', 'image': 'images/poland.png', 'name': 'POLAND'},
    {'id': '4', 'image': 'images/usa.png', 'name': 'USA'},
    {'id': '5', 'image': 'images/africa.png', 'name': 'AFRICA'},
  ];

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "    Login Account",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            value: _selected,
                            onChanged: (newValue) {
                              setState(() {
                                _selected = newValue as String?;
                              });
                            },
                            items: _myJson.map((Country) {
                              return DropdownMenuItem(
                                value: Country['id'],
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                        Country['image'],
                                      ),
                                    )
                                    /* Image.asset(
                                      Country['image'],
                                      width: 30,
                                    ),*/
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                "Hello,Welcome back to our accout                       ",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryLite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                      ),
                      controller: _tabController,
                      labelColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: 'Email',
                        ),
                        Tab(
                          text: 'Mobile',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildEmailLoginTab(),
                _buildMobileLoginTab(),
              ],
            ),
          ),
          const Divider(),
          const Text('or Sign in with Google'),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Get.to(const verification());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                        height: 25),
                    const Text(
                      'Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Not Register yet ?"),
              TextButton(
                  onPressed: () {
                    Get.to(const verification());
                  },
                  child: const Text(
                    'Create an Account',
                    style: TextStyle(color: primary),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildEmailLoginTab() {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              )),
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/verification');
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primary,
                ),
                child: Text("Login",
                    style: titleMedium(
                        context: context,
                        textStyle: const TextStyle(color: white))),
              ),
            ),
          ),
        ],
      ),
    );
  });
}

Widget _buildMobileLoginTab() {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            child: TextFormField(
              controller: phoneController,
              decoration: buildInputDecoration(Icons.phone, "Phone"),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                _formKey.currentState?.validate();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter a Phone Number";
                } else if (!RegExp(
                        r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                    .hasMatch(value)) {
                  return "Please Enter a Valid Phone Number";
                }
              },
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/verification');
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primary,
                ),
                child: Text(
                  "Request Otp",
                  style: titleMedium(
                    context: context,
                    textStyle: const TextStyle(color: white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}

InputDecoration buildInputDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(color: Colors.teal, width: 2),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
  );
}
