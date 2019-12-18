class EnumTransfer {
  static Map<String,String> stateMap = <String,String>{
    '0':'正常',
    '1':'生病',
    '2':'送宰',
    '3':'死亡'
  };
  static getStateText(String state){
    if(state==null){
      state = '0';
    }
    return stateMap[state];
  }

}