import 'package:flutter/material.dart';

class Toast{
  static ToastView toastView;
  static show(BuildContext context,String msg,Function callback){
    toastView?.dismiss();
    toastView = null;
    OverlayState _overlayState = Overlay.of(context);
    var controllerShowAnim = new AnimationController(
      vsync: _overlayState,
      duration: Duration(milliseconds: 250),
    );
    var controllerShowOffset = new AnimationController(
      vsync: _overlayState,
      duration: Duration(milliseconds: 350),
    );
    var controllerHide = new AnimationController(
      vsync: _overlayState,
      duration: Duration(milliseconds: 250),
    );
    var opacityAnim1 =
    new Tween(begin: 0.0, end: 1.0).animate(controllerShowAnim);
    var controllerCurvedShowOffset = new CurvedAnimation(
        parent: controllerShowOffset, curve: _BounceOutCurve._());
    var offsetAnim =
    new Tween(begin: 0.0, end: 0.0).animate(controllerCurvedShowOffset);
    var opacityAnim2 = new Tween(begin: 1.0, end: 0.0).animate(controllerHide);


    OverlayEntry _overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return ToastWidget(
        opacityAnim1: opacityAnim1,
        opacityAnim2: opacityAnim2,
        offsetAnim: offsetAnim,
        child: _buildToastLayout(msg),
      );
    });
    toastView = ToastView(_overlayEntry,_overlayState);
    toastView.controllerShowAnim = controllerShowAnim;
    toastView.controllerShowOffset = controllerShowOffset;
    toastView.controllerHide = controllerHide;
    toastView._show();
  }

  static _buildToastLayout(msg){
    return LayoutBuilder(builder: (context, constraints) {
        return IgnorePointer(
            ignoring: true,
            child: Container(
                child: Material(
                    color:Colors.white.withOpacity(0),
                    child:Container(
                        child: Container(
                          child:Center(child:Text('${msg}',style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        ),
                        margin:EdgeInsets.only(
                            top: constraints.biggest.height * 0.45,
                            bottom: constraints.biggest.height * 0.45,
                            left: constraints.biggest.width * 0.2,
                            right: constraints.biggest.width * 0.2
                        )
                    )
                )
            )
        );
    });
  }
}


class ToastView{
  OverlayEntry overlayEntry;
  OverlayState overlayState;
  AnimationController controllerShowAnim;
  AnimationController controllerShowOffset;
  AnimationController controllerHide;
  bool dismissed = false;
  ToastView(this.overlayEntry,this.overlayState);
  _show() async {
    overlayState.insert(overlayEntry);
    controllerShowAnim.forward();
    controllerShowOffset.forward();
    await Future.delayed(Duration(milliseconds: 1500));
    this.dismiss();
  }

  dismiss() async {
    if (dismissed) {
      return;
    }
    this.dismissed = true;
    controllerHide.forward();
    await Future.delayed(Duration(milliseconds: 250));
    overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {
  final Widget child;
  final Animation<double> opacityAnim1;
  final Animation<double> opacityAnim2;
  final Animation<double> offsetAnim;

  ToastWidget(
      {this.child, this.offsetAnim, this.opacityAnim1, this.opacityAnim2});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAnim1,
      child: child,
      builder: (context, child_to_build) {
        return Opacity(
          opacity: opacityAnim1.value,
          child: AnimatedBuilder(
            animation: offsetAnim,
            builder: (context, _) {
              return Transform.translate(
                offset: Offset(0, offsetAnim.value),
                child: AnimatedBuilder(
                  animation: opacityAnim2,
                  builder: (context, _) {
                    return Opacity(
                      opacity: opacityAnim2.value,
                      child: child_to_build,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _BounceOutCurve extends Curve {
  const _BounceOutCurve._();

  @override
  double transform(double t) {
    t -= 1.0;
    return t * t * ((2 + 1) * t + 2) + 1.0;
  }
}