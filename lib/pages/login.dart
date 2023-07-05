import 'package:flutter/material.dart';
import 'package:yaduzfashion/widgets/logininfo.dart';
import 'package:yaduzfashion/widgets/signupinfo.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState(){
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  Map<String, Widget> map = {
    "login": const Text("Login"),
    "signup": const Text("SignUp"),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
              clipper: CurveClipper(),
              child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.32,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "assets/images/back1.png",
                          fit: BoxFit.fitWidth,
                        ),
                    ),
                  ),
              Positioned(
                top: MediaQuery.of(context).size.height*0.18,
                left: MediaQuery.of(context).size.width*0.15,
                child: Image.asset("assets/images/logo1.png"),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*0.185,
                left: MediaQuery.of(context).size.width*0.25,
                child: Text(
                  "ADUZ  FASHION",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width*0.08,
                    fontFamily: "Quicksand SemiBold",
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*0.23,
                left: MediaQuery.of(context).size.width*0.33,
                child: Text(
                  "ONE STOP FOR ALL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width*0.04,
                    fontFamily: "Segoe Print",
                    fontWeight: FontWeight.w100
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
          TabBar(
            labelColor: const Color(0xFFB51843),
              unselectedLabelColor: const Color(0xff272727),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600
              ),
              indicatorColor: const Color(0xFFB51843),
              tabs: const [
                Tab(text: "Login",),
                Tab(text: "Sign Up",),
              ],
            controller: _tabController,
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
               LoginInfo(),
                SignUpInfo()
              ],
            ),
          ),
        ],
      )
    );
  }
}
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 18;
    Offset controlPoint = Offset(size.width /2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}