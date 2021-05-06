import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 1200));
    _animation=Tween<Size>(
        begin:Size(100,100),
        end: Size(120,120)
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceIn)
    );
    _controller.addStatusListener((AnimationStatus status) {
      if(status==AnimationStatus.completed){
        _controller.repeat();
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:Text("Flutter animation"),
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (ctx,ch)=>Container(
            height:_animation.value.height,

            width: _animation.value.width,
            child: Image.asset("assets/images/heart.png"),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          _controller.forward();
        },
      ),
    );
  }
}
