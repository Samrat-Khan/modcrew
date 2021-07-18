class ProductDataX {
  final String name;
  final double price;
  final String detail;
  final int totalStock;
  final String imagePath;
  final bool isSale;
  final double discount;

  ProductDataX({
    required this.name,
    required this.price,
    required this.detail,
    required this.totalStock,
    required this.imagePath,
    required this.discount,
    required this.isSale,
  });
}

final List<ProductDataX> carData = [
  ProductDataX(
    name: "Honda Clarity",
    price: 5000,
    detail:
        "The FCX Clarity electrical power comes from a 100 kW Honda Vertical Flow (V Flow) hydrogen fuel cell stack whereby electricity is supplied on demand. In common with many electric vehicles, the car has regenerative braking and uses a separate battery to store energy recovered during braking.",
    totalStock: 50,
    imagePath: "assets/images/car1.png",
    discount: 0,
    isSale: false,
  ),
  ProductDataX(
    name: "Lamborghini Huracán",
    price: 7000,
    detail:
        "As you probably already know, huracán means \"hurricane\" in Spanish, and a name like that would only suit a handful of brands. Thankfully, Lamborghini is one of those. With its 5.2-liter V-10, 602 hp, and 2.8 second sprint from 0 to 60 mph, the Huracán has one of the best car names, and it suits the car aptly.",
    totalStock: 10,
    imagePath: "assets/images/car2.png",
    discount: 5,
    isSale: true,
  ),
  ProductDataX(
    name: "Ferrari 812 Superfast",
    price: 10000,
    detail:
        "The word \"super\" makes any name attractive. Especially on a Ferrari. And especially when you attach the word \"fast\" at the end. The Ferrari 812 Superfast, with 789 horsepower coming out of its V-12 engine, is a super-fast Ferrari and also one of the most interesting car names.",
    totalStock: 5,
    imagePath: "assets/images/car3.png",
    discount: 0,
    isSale: false,
  ),
  ProductDataX(
    name: "Jeep Gladiator",
    price: 2000,
    detail:
        "Before the Jeep Gladiator came out, there were rumors about the Comanche name coming back. But we're happy Jeep went with a different and more appealing classic Jeep name for a truck like the Gladiator. Although it's not fast like the Raptor, it tackles off-road trails like few can, and it has one of the best car names in the industry.",
    totalStock: 10,
    imagePath: "assets/images/car4.png",
    isSale: true,
    discount: 2,
  ),
  ProductDataX(
      name: "Dress 1",
      price: 100,
      detail:
          "The FCX Clarity electrical power comes from a 100 kW Honda Vertical Flow (V Flow) hydrogen fuel cell stack whereby electricity is supplied on demand. In common with many electric vehicles, the car has regenerative braking and uses a separate battery to store energy recovered during braking.",
      totalStock: 300,
      imagePath: "assets/images/f1.png",
      discount: 0,
      isSale: false),
  ProductDataX(
      name: "Dress 2",
      price: 200,
      detail:
          "The FCX Clarity electrical power comes from a 100 kW Honda Vertical Flow (V Flow) hydrogen fuel cell stack whereby electricity is supplied on demand. In common with many electric vehicles, the car has regenerative braking and uses a separate battery to store energy recovered during braking.",
      totalStock: 300,
      imagePath: "assets/images/f2.png",
      discount: 0,
      isSale: false),
  ProductDataX(
      name: "Dress1",
      price: 100,
      detail:
          "The FCX Clarity electrical power comes from a 100 kW Honda Vertical Flow (V Flow) hydrogen fuel cell stack whereby electricity is supplied on demand. In common with many electric vehicles, the car has regenerative braking and uses a separate battery to store energy recovered during braking.",
      totalStock: 300,
      imagePath: "assets/images/f3.png",
      discount: 10,
      isSale: true),
  ProductDataX(
      name: "Dress1",
      price: 90,
      detail:
          "The FCX Clarity electrical power comes from a 100 kW Honda Vertical Flow (V Flow) hydrogen fuel cell stack whereby electricity is supplied on demand. In common with many electric vehicles, the car has regenerative braking and uses a separate battery to store energy recovered during braking.",
      totalStock: 10,
      imagePath: "assets/images/f4.png",
      discount: 0,
      isSale: false),
  ProductDataX(
      name: "Accessories 1",
      price: 100,
      detail:
          "The FCX Clarity electrical power comes from a 100 kW Honda Vertical Flow (V Flow) hydrogen fuel cell stack whereby electricity is supplied on demand. In common with many electric vehicles, the car has regenerative braking and uses a separate battery to store energy recovered during braking.",
      totalStock: 300,
      imagePath: "assets/images/a1.png",
      discount: 10,
      isSale: true),
  ProductDataX(
      name: "Accessories 2",
      price: 100,
      detail:
          "The FCX Clarity electrical power comes from a 100 kW Honda Vertical Flow (V Flow) hydrogen fuel cell stack whereby electricity is supplied on demand. In common with many electric vehicles, the car has regenerative braking and uses a separate battery to store energy recovered during braking.",
      totalStock: 300,
      imagePath: "assets/images/a2.png",
      discount: 10,
      isSale: true),
  ProductDataX(
      name: "Accessories 3",
      price: 100,
      detail:
          "The FCX Clarity electrical power comes from a 100 kW Honda Vertical Flow (V Flow) hydrogen fuel cell stack whereby electricity is supplied on demand. In common with many electric vehicles, the car has regenerative braking and uses a separate battery to store energy recovered during braking.",
      totalStock: 300,
      imagePath: "assets/images/a3.png",
      discount: 10,
      isSale: true),
  ProductDataX(
      name: "Accessories 4",
      price: 100,
      detail:
          "The FCX Clarity electrical power comes from a 100 kW Honda Vertical Flow (V Flow) hydrogen fuel cell stack whereby electricity is supplied on demand. In common with many electric vehicles, the car has regenerative braking and uses a separate battery to store energy recovered during braking.",
      totalStock: 300,
      imagePath: "assets/images/a4.png",
      discount: 10,
      isSale: true),
];
