class Order {
  String name;
  String phone;
  String volume;
  String address;

  String receive_time;

  String amount;
  String paid_amount;
  String coupon_code;

  String payment_method;

  Order(this.name, this.phone, this.volume, this.address, this.receive_time,
      this.amount, this.paid_amount, this.coupon_code, this.payment_method);
}
