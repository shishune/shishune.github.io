class Product{
  String name, imageURL;
  double price ;
  int count = 0;

  Product({required this.name, required this.imageURL, required this.price});

  void incrementCount(){
    count += 1;
  }

  void decrementCount(){
    if(count > 0){
      count -= 1;
    }
  }

  String getPrice(){
    return price.toStringAsFixed(2);
  }
}