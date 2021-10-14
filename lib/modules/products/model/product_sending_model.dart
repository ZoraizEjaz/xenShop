/// userId : 1
/// date : "2020-03-02T00:00:02.000Z"
/// products : [{"productId":1,"quantity":4},{"productId":2,"quantity":1}]

class Product_sending_model {
  Product_sending_model({
      int? userId, 
      String? date, 
      List<Products>? products,}){
    _userId = userId;
    _date = date;
    _products = products;
}

  Product_sending_model.fromJson(dynamic json) {
    _userId = json['userId'];
    _date = json['date'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  int? _userId;
  String? _date;
  List<Products>? _products;


  set setUserId(int value) {
    _userId = value;
  }
  set setDate(String value) {
    _date = value;
  }

  set setProducts(List<Products> value) {
    _products = value;
  }

  int? get userId => _userId;
  String? get date => _date;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['date'] = _date;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }


}

/// productId : 1
/// quantity : 4

class Products {
  Products({
      int? productId, 
      int? quantity,}){
    _productId = productId;
    _quantity = quantity;
}

  Products.fromJson(dynamic json) {
    _productId = json['productId'];
    _quantity = json['quantity'];
  }
  int? _productId;
  int? _quantity;

  set setProductId(int value) {
    _productId = value;
  }
  set setQuantity(int value) {
    _quantity = value;
  }

  int? get quantity => _quantity;
  int? get productId => _productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['quantity'] = _quantity;
    return map;
  }

}