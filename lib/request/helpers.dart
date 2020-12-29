
class CrudHelpers{
  Map<String, dynamic> createPutBody(Map<String,dynamic> old, Map<String, dynamic> data){
    print(old);
    old.forEach((key, value) {
      if(data.containsKey(key) && data[key].toString().isNotEmpty){
        if(data[key] != value){
          value = data[key];
        }
      }
    });
    print("After update \n\n");
    print(old);
    return old;
  }
}