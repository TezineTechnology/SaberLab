
class EViewArguments{
  var _map=new Map();

  void setArgValue(String key, String value){
    _map[key]=value;
  }

  String getArgValue(String key){
    if(_map.containsKey(key))return _map[key];
    else return null;
  }
}