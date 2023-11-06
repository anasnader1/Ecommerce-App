import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  String label;
  TextInputType keyboardTybe;
  TextEditingController controller;
  String? Function (String?)Validator;
  bool isPassword ;
  customTextField({required this.label,this.keyboardTybe=TextInputType.text,required this.controller,required this.Validator,
    this.isPassword=false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            label: Text(label),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    width: 3,
                    color: Theme.of(context).primaryColor
                )
            )
        ),
        keyboardType: keyboardTybe,
        controller:controller ,
        validator: Validator,
        obscureText: isPassword,

      ),
    );


  }
}
