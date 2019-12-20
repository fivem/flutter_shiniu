import 'package:flutter/material.dart';

class Mask{
  static MaskView maskView;
  static show(BuildContext context){
    maskView?._dismiss();
    OverlayState _overlayState=Overlay.of(context);
    OverlayEntry _overlayEntry = OverlayEntry(builder:(BuildContext context){
      return Container(
        child: Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Material(
                color:Colors.white.withOpacity(0),
                child:GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6)
                    ),
                  ),
                  onTap: (){
                  },
              ),
            )
        ),
      )
      );
    });
    maskView = MaskView(overlayState: _overlayState,overlayEntry: _overlayEntry);
    maskView._show();
  }
  static dismiss(){
    maskView?._dismiss();
  }
}

class MaskView  {
  OverlayState overlayState;
  OverlayEntry overlayEntry;
  bool dismissed = false;
  MaskView({this.overlayState,this.overlayEntry});
  _show(){
    overlayState.insert(overlayEntry);
  }
  _dismiss(){
    if (dismissed) {
      return;
    }
    this.dismissed = true;
    overlayEntry?.remove();
  }
}
