import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingcart/product.dart';
import 'package:shoppingcart/cart.dart';


void main(){
  group('Product Count', (){
    test('Given product When increment Then count changes', ()  {
      // Arrange
      Product product = Product(name:"Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00);
      // Act
      product.incrementCount();
      // Assert
      expect(product.count, 1);

    });

    test('Given product When increment multiple Then count changes', ()  {
      // Arrange
      Product product = Product(name:"Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00);
      // Act
      product.incrementCount();
      product.incrementCount();
      product.incrementCount();
      // Assert
      expect(product.count, 3);

    });


    test('Given product When count < 0 Then do not decrement', ()  {
      // Arrange
      Product product = Product(name:"Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00);
      // Act
      product.decrementCount();
      // Assert
      expect(product.count, 0);

    });

    test('Given product When increment and decrement Then value is correct', ()  {
      // Arrange
      Product product = Product(name:"Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00);
      // Act
      product.incrementCount();
      product.decrementCount();
      product.incrementCount();
      product.incrementCount();

      // Assert
      expect(product.count, 2);

    });
  });
  group('Product Price', () {
    test('Given product When getprice() Then price is string with two decimal points', ()  {
      // Arrange
      Product product = Product(name:"Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00);
      // Assert
      expect(product.getPrice(), "1.00");
    });
  });


  group('Cart subtotal', () {
    test('Given no products in cart When get subTotal Then 0', ()  {
      // Arrange
      Cart cart = Cart([]);

      // Assert
      expect(cart.getSubTotal(), 0);
    });

    test('Given one products with 0 count in cart When get subTotal Then 0', ()  {
      // Arrange
      Cart cart = Cart([ Product(name:"Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00)]);

      // Assert
      expect(cart.getSubTotal(), 0);
    });
    test('Given one products with 1 count in cart When get subTotal Then correct', ()  {
      // Arrange
      Cart cart = Cart([ Product(name:"Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00)]);
      // Act
      cart.products[0].incrementCount();
      // Assert
      expect(cart.getSubTotal(), 1);
    });

    test('Given multiple products with 1 count in cart When get subTotal Then correct', ()  {
      // Arrange
      Cart cart = Cart([
        Product(name:"Noodles",
            imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
            price: 1.00),
        Product(name:"Soup",
            imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
            price: 0.50)]);
      // Act
      cart.products[0].incrementCount();
      cart.products[1].incrementCount();
      // Assert
      expect(cart.getSubTotal(), 1.5);
    });

  });

  group('Cart tax', () {
    test('Given no products in cart When get tax Then 0', ()  {
      // Arrange
      Cart cart = Cart([]);

      // Assert
      expect(cart.getTax(), 0);
    });

    test('Given one products with 0 count in cart When get tax Then 0', ()  {
      // Arrange
      Cart cart = Cart([ Product(name:"Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00)]);

      // Assert
      expect(cart.getTax(), 0);
    });
    test('Given one products with 1 count in cart When get tax Then correct', ()  {
      // Arrange
      Cart cart = Cart([ Product(name:"Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00)]);
      // Act
      cart.products[0].incrementCount();
      // Assert
      expect(cart.getTax(), 0.13);
    });

    test('Given multiple products with 1 count in cart When get tax Then correct', ()  {
      // Arrange
      Cart cart = Cart([
        Product(name:"Noodles",
            imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
            price: 10.00),
        Product(name:"Soup",
            imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
            price: 1.00)]);
      // Act
      cart.products[0].incrementCount();
      cart.products[1].incrementCount();
      // Assert
      expect(cart.getTax(), 1.43);
    });

  });


  group('Cart total', () {
    test('Given no products in cart When get total Then 0', () {
      // Arrange
      Cart cart = Cart([]);

      // Assert
      expect(cart.getTotal(), 0);
    });

    test('Given one products with 0 count in cart When get total Then 0', () {
      // Arrange
      Cart cart = Cart([ Product(name: "Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00)
      ]);

      // Assert
      expect(cart.getTotal(), 0);
    });
    test(
        'Given one products with 1 count in cart When get total Then correct', () {
      // Arrange
      Cart cart = Cart([ Product(name: "Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00)
      ]);
      // Act
      cart.products[0].incrementCount();
      // Assert
      expect(cart.getTotal(), (1*1.13));
    });

    test(
        'Given multiple products with 1 count in cart When get total Then correct', () {
      // Arrange
      Cart cart = Cart([
        Product(name: "Noodles",
            imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
            price: 10.00),
        Product(name: "Soup",
            imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
            price: 1.00)
      ]);
      // Act
      cart.products[0].incrementCount();
      cart.products[1].incrementCount();
      // Assert
      expect(cart.getTotal(), (11*1.13));
    });
  });

  group('Cart Discount + total', () {
    test('Given no products in cart When discount applied get discount and total Then 0', () {
      // Arrange
      Cart cart = Cart([]);
      // act
      cart.applyDiscount();
      // Assert
      expect(cart.getDiscount(), 0);
      expect(cart.getTotal(), 0);
    });

    test('Given one products with 0 count in cart When discount applied get discount and total Then 0', () {
      // Arrange
      Cart cart = Cart([ Product(name: "Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00)
      ]);
      // act
      cart.applyDiscount();

      // Assert
      expect(cart.getDiscount(), 0);
      expect(cart.getTotal(), 0);
    });
    test(
        'Given one products with 1 count in cart When discount applied get total Then correct', () {
      // Arrange
      Cart cart = Cart([ Product(name: "Noodles",
          imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
          price: 1.00)
      ]);
      // Act
      cart.products[0].incrementCount();
      cart.applyDiscount();
      // Assert
      expect(cart.getDiscount(), -0.2);
      expect(cart.getTotal(), 0.9);
    });

    test(
        'Given multiple products with 1 count in cart When discount applied get total Then correct', () {
      // Arrange
      Cart cart = Cart([
        Product(name: "Noodles",
            imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
            price: 9.00),
        Product(name: "Soup",
            imageURL: "https://cdn.discordapp.com/attachments/703727602350686348/894113828659404841/unknown.png",
            price: 1.00)
      ]);
      // Act
      cart.products[0].incrementCount();
      cart.products[1].incrementCount();
      cart.applyDiscount();
      // Assert
      expect(cart.getDiscount(), -2);
      expect(cart.getTotal(), (9.04));
    });
  });

  // test('Given When Then', ()  {
  //   // Arrange
  //
  //   // Act
  //
  //   // Assert
  //
  // });


}