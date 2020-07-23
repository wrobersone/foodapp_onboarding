import 'package:app_onboarding/animations/fadeanimation.dart';
import 'package:app_onboarding/pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((value) => Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.2),
            ]),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                    .5,
                    Text(
                      'Taking Orders for Fast Delivery',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1,
                    Text(
                      "See venues and events near you.",
                      style: TextStyle(
                          color: Colors.white, height: 1.4, fontSize: 18),
                    )),
                SizedBox(
                  height: 120.0,
                ),
                FadeAnimation(
                  1.2,
                  ScaleTransition(
                      scale: _animation,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [Colors.yellow, Colors.orange])),
                          child: AnimatedOpacity(
                            opacity: _textVisible ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 50),
                            child: MaterialButton(
                              onPressed: () => _onTap(),
                              minWidth: double.infinity,
                              child: Text(
                                "Start",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))),
                ),
                SizedBox(
                  height: 30.0,
                ),
                FadeAnimation(
                    1.4,
                    AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 50),
                      child: Align(
                        child: Text(
                          "Now Deliver To Your Door",
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
