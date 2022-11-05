class Order {
  late double _cost;
  late String _address;
  late String _streetName;
  late String _product;
  late String _note;
  double _userReviewStars = 0;
  Order(
    this._cost, {
    String address = "orderAdress",
    String streetName = "orderStreet",
    String product = "orderProduct",
    String note = "",
  }) {
    _address = address;
    _streetName = streetName;
    _product = product;
    _note = note;
  }

  void setOrderReviewStars(double ratingStars) {
    _userReviewStars = ratingStars;
  }
}
