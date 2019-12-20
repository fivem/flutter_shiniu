import 'dart:async';
class Debounce{
  Function debounce(Function fn,[int time = 200]){
    Timer _debounce;
    return () {
      if (_debounce?.isActive ?? false) {
        _debounce.cancel();
      }
      _debounce = Timer(Duration(milliseconds: time), fn);
    };
  }
}
