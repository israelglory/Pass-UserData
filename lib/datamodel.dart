class Item {
  String itemName;
  Item(this.itemName);

  Item.fromMap(Map map) : itemName = map['itemName'];

  Map toMap() {
    return {
      'itemName': itemName,
    };
  }
}
