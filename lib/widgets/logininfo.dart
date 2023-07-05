import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaduzfashion/controller/logincontroller.dart';

class LoginInfo extends StatefulWidget {
  LoginInfo({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LoginInfo> createState() => _LoginInfoState();
}

class _LoginInfoState extends State<LoginInfo> {
  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: LoginInfo._formKey,
          child: Column(
            children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  prefixIcon: Image.asset("assets/images/email.png", fit: BoxFit.scaleDown,),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  )
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (input) {
                const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                    r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                final regex = RegExp(pattern);
                if(input!.isEmpty) {
                  return "Please Enter Email";
                }
                return input.isNotEmpty && !regex.hasMatch(input)
                    ? 'Enter a valid email address'
                    : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailController,
            ),
            const SizedBox(height: 20,),
            Obx(() => TextFormField(
              obscureText: controller.obsVal.value,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                  prefixIcon: SvgPicture.asset("assets/images/Icon.svg", fit: BoxFit.scaleDown,),
                  suffixIcon: IconButton(
                    onPressed: (){
                      controller.updateObs();
                      },
                    icon: controller.obsVal.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                  ),
                  border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                )
              ),
              keyboardType: TextInputType.visiblePassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _passController,
              validator: (input) {
                RegExp regex =
                RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~]).{8,}$');
                if (input!.isEmpty) {
                  return 'Please enter password';
                } else {
                  if (!regex.hasMatch(input)) {
                    return 'Enter valid password';
                  } else {
                    return null;
                  }
                }
              },
            ),
            ),
            const SizedBox(height: 10,),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text("Forgot Password?",
                style: TextStyle(
                  color: Color(0xffB51843)
                ),),
                onPressed: (){},
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.12,),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: TextButton(
                  child: Image.asset("assets/images/google.png", fit: BoxFit.fitWidth,),
                  onPressed: () async{
                    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

                    final credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth?.accessToken,
                      idToken: googleAuth?.idToken
                    );
                    print(googleUser?.email);
                    FirebaseAuth.instance.signInWithCredential(credential);
                  },
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: TextButton(onPressed: () async {
                if(LoginInfo._formKey.currentState!.validate()){
                  final auth = FirebaseAuth.instance;
                  auth.signInWithEmailAndPassword(email: _emailController.text, password: _passController.text);
                }
                else{
                  Get.snackbar(
                    "Error",
                      "Please Input Data"
                  );
                }
              }, style: TextButton.styleFrom(
                backgroundColor: const Color(0xffB51843),
                foregroundColor: Colors.white,
              ), child: const Text("Login",),),
            )
          ],
        ),
      ),
      ),
    );
  }
}
