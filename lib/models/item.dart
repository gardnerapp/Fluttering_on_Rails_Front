class Item{
  String name;
  String created_at;
  String updated_at;
  int price;
  int id;


  Item(this.name, this.price, this.id);
  Item.fromMap(Map<String, dynamic> map){
    this.name = map['name'];
    this.created_at = map['created_at'];
    this.updated_at = map['updated_at'];
    this.price = map['price'];
    this.id = map['id'];
  }

  Map<String, dynamic> mapFromFields(){
    return {
      'name': this.name,
      'price': this.price
    };
  }
  //rather then setting fields extract map then use data to compare to mape
  //compare K and Values of new maps
 }