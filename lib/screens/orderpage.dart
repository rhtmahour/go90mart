import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  void _saveOrder() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('customer').add({
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'mobileNumber': _mobileNumberController.text,
        'email': _emailController.text,
        'address': _addressController.text,
        'city': _cityController.text,
        'postalCode': _postalCodeController.text,
      });

      // Clear the text fields
      _firstNameController.clear();
      _lastNameController.clear();
      _mobileNumberController.clear();
      _emailController.clear();
      _addressController.clear();
      _cityController.clear();
      _postalCodeController.clear();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thank You!'),
            content: const Text('Your order has been placed successfully.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 28,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Fill Order Details",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(162, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                buildTextField(_firstNameController, "First Name"),
                buildTextField(_lastNameController, "Last Name"),
                buildTextField(_mobileNumberController, "Mobile Number"),
                buildTextField(_emailController, "Email"),
                buildTextField(_addressController, "Address"),
                buildTextField(_cityController, "City"),
                buildTextField(_postalCodeController, "Postal/Zip Code"),
                const SizedBox(height: 50),
                InkWell(
                  onTap: _saveOrder,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Order Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hintText) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      width: 370,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          }
          return null;
        },
      ),
    );
  }
}
