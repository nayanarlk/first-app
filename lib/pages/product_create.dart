import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _description = '';
  double _price = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Product Title'),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                _description = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                _price = double.parse(value);
              });
            },
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('Save'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'description': _description,
                'price':_price,
                'image': 'assets/sweets.jpg'
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
