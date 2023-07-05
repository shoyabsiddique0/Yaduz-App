import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yaduzfashion/controller/signupcontroller.dart';

class SignUpInfo extends StatefulWidget {
  SignUpInfo({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  final _emailController = TextEditingController();

  final _nameController = TextEditingController();

  final _passController = TextEditingController();

  final _emailConfController = TextEditingController();

  final _phoneController = TextEditingController();

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: SignUpInfo._formKey1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter Your Name",
                    prefixIcon: Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    )),
                keyboardType: TextInputType.name,
                validator: (input) {
                  const pattern ="[a-zA-Z]";
                  final regex = RegExp(pattern);
                  if (input!.isEmpty) {
                    return "Please Enter Your Name";
                  }
                  return input.isNotEmpty && !regex.hasMatch(input)
                      ? 'Enter a valid Name'
                      : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter Your Phone Number",
                    prefixIcon: Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Text("+91  | "),
                        ],
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(maxWidth: 100),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    )),
                keyboardType: TextInputType.emailAddress,
                validator: (input) {
                  const pattern =
                      r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$";
                  final regex = RegExp(pattern);
                  if (input!.isEmpty) {
                    return "Please Enter Phone Number";
                  }
                  return input.isNotEmpty && !regex.hasMatch(input)
                      ? 'Enter a valid phone number'
                      : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _phoneController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter Your Email Address",
                    prefixIcon: Image.asset(
                      "assets/images/email.png",
                      fit: BoxFit.scaleDown,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    )),
                keyboardType: TextInputType.emailAddress,
                validator: (input) {
                  const pattern =
                      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                  final regex = RegExp(pattern);
                  if (input!.isEmpty) {
                    return "Please Enter Email";
                  }
                  return input.isNotEmpty && !regex.hasMatch(input)
                      ? 'Enter a valid email address'
                      : null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailConfController,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(()=> TextFormField(
                  obscureText: controller.obsVal.value,
                  decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      prefixIcon: SvgPicture.asset(
                        "assets/images/Icon.svg",
                        fit: BoxFit.scaleDown,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.updateObs();
                        },
                        icon: controller.obsVal.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      )),
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passController,
                  validator: (input) {
                    RegExp regex = RegExp(
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
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Obx(() => Checkbox(
                        value: controller.chkVal.value,
                        onChanged: (val) {
                          controller.updateChk(val);
                        }),
                  ),
                  Expanded(
                    child: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            text: "By signing up you agree to our ",
                            children: [
                              TextSpan(
                                text: "Terms & Conditions ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              TextSpan(text: "and "),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              )
                            ])),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    if (SignUpInfo._formKey1.currentState!.validate()) {
                      final auth = FirebaseAuth.instance;
                      print(_emailController.text);
                      print(_passController.text);
                      auth.createUserWithEmailAndPassword(email: _emailConfController.text, password: _passController.text);
                    } else {
                      Get.snackbar("Error", "Please Input Data");
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffB51843),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Sign Up",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
