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
      period = '0';
     }
     return periodMap[period];
  }

  static Map<String,String> periodNavigatorMap = <String,String>{
    'waitingParturition':'待产期',
    'pregnancy':'怀孕期',
    'interruption':'休止期'
  };

  static getNavigatorText(String navigator){
    return periodNavigatorMap[navigator];
  }

  static Map<String,String> columnTitleMap = <String,String>{
    'waitingParturition':'预产日期',
    'pregnancy':'受精日期',
    'interruption':'生产日期'
  };
  static getColumnTitleMap(String navigator){
    return columnTitleMap[navigator];
  }

  static Map<String,String> navigatorKeyMap = <String,String>{
    'waitingParturition':'0',
    'pregnancy':'1',
    'interruption':'2'
  };
  static getNavigatorKey(String navigator){
    return navigatorKeyMap[navigator];
  }

}