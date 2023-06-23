import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../setting.dart';


class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 252, 115, 36),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              // Text(
              //   "Edit Profile",
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              // ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Color.fromARGB(255, 252, 115, 36),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", "Aurora", false),
              buildTextField("E-mail", "aurora@gmail.com", false),
              buildTextField("Password", "********", true),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(colors: [Color.fromARGB(255, 252, 115, 36), Color.fromARGB(255, 252, 115, 36)]),
                ),
                child: MaterialButton(
                  onPressed: (){},
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }  

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../routes/app_pages.dart';
// import '../controllers/profile_controller.dart';



// class UserScreen extends GetView<ProfileController> {
//   UserScreen({Key? key}) : super(key: key) {
//     Get.put(ProfileController());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: Text(
//             "Profile",
//             style: TextStyle(color: Colors.black),
//           ),
//           // leading: IconButton(
//           //   color: Colors.black,
//           //   icon: Icon(Icons.arrow_back),
//           //   onPressed: () {
//           //     Get.offAllNamed(Routes.DASHBOARD);
//           //   },
//           // ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
             
//               ListTile(
//                   leading: Icon(Icons.person, size: 50),
//                   title: Text('First Name'),
//                   subtitle: TextField(
//                     controller: TextEditingController(
//                         text: controller.userData['firstname'] ?? ''),
//                   )),
//               SizedBox(
//                 height: 5,
//                 width: 5,
//               ),
//               ListTile(
//                 leading: Icon(Icons.person, size: 50),
//                 title: Text('Last Name'),
//                 subtitle: TextField(),
//               ),
//               SizedBox(
//                 height: 5,
//                 width: 5,
//               ),
//               ListTile(
//                 leading: Icon(Icons.email, size: 50),
//                 title: Text('Email'),
//                 subtitle: TextField(),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               ElevatedButton(onPressed: () {}, child: Text("Ganti Nama")),
//               Text(
//                   "Aplikasi ATLET ini masih tahap pengembangan, terima kasih\n Kunjungi Fiverr saya muhamadsyabani",
//                   textAlign: TextAlign.center)
//             ],
//           ),
//         ));
//   }
// }
