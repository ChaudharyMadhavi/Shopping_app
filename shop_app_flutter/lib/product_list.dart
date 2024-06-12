import 'package:flutter/material.dart';
import './globle_variables.dart';
import './product_details_page.dart';
import './products_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = [
    'All',
    'Rolex',
    'Titan',
    'FireBolt',
  ];

  late String selectedFilters = filters[0];

  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(106, 182, 236, 1),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ));
    return SafeArea(
      //Header with searchBar
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Watches\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: border,
                    enabledBorder: border,
                    focusedBorder:
                        border, //when we focused the border it's color will as the seedcolor as we set the focusedborder it will remain same
                  ),
                ),
              ),
              //left space will be cover with the textfield
            ],
          ),
          //all the options button that we have

          SizedBox(
            height: 120,
            child: ListView.builder(
              //for list to display
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                final filter =
                    filters[index]; //new variable that shows the filter's index
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //  decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),

                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //to go to another button
                        selectedFilters = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilters == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 247, 1),
                      label: Text(
                        filter,
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(102, 134, 134, 1),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          //products
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  //to goto the homepage to the product detail page
                  onTap: () {
                    Navigator.of(context).push(
                      //navigator.of(contex) will call to the navigator state then we can do push and pop
                      MaterialPageRoute(builder:
                          (context) // for material and cupertino there is a transition system
                          {
                        return ProductDetailsPage(product: product);
                      }),
                    );
                  },
                  child: ProductsCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imgUrl'] as String,
                    backgroundcolor: index.isEven
                        ? const Color.fromARGB(255, 191, 213, 225)
                        : const Color.fromARGB(255, 198, 200, 202),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
