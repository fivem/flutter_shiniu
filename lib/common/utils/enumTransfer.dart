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


  static Map<String,String> periodMap = <String,String>{
    '0':'待产期',
    '1':'怀孕期',
    '2':'休止期'
  };
  static getPeriodText(String period){
    if(period==null){
      period = '2';
     }
     return periodMap[period];
  }
}