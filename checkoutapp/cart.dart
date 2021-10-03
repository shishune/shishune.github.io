import 'product.dart';

class Cart{
  List<Product> products;
  bool discountApplied = false;

  Cart(this.products);

  void addProduct(Product newProduct){
    products.add(newProduct);
  }

  double getSubTotal(){
    double subTotal = 0;
    for (var product in products) {
      subTotal += product.price * product.count.toDouble();
    }

    return (subTotal * 100).roundToDouble() / 100;
  }

  void applyDiscount(){
    if(!discountApplied){
      discountApplied = true;
    }
  }
  double getDiscount(){
    double discount = 0.0;
    if(discountApplied){
      discount  = getSubTotal() * -0.2;
    }
    return (discount * 100).roundToDouble() / 100;
  }

  double getTotal(){
    double subTotal = getSubTotal();
    double discount = getDiscount();
    double tax = getTax();
    return  subTotal + discount + tax;
  }

  double getTax(){
    return ((getSubTotal() + getDiscount())* 0.13 * 100).roundToDouble() /100;
  }
}