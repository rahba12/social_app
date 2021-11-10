import 'package:flutter/material.dart';

Widget buildTextField(
  IconData icon,
  String hintText,
  bool isPassword,
  bool isEmail,
  FormFieldValidator<String>? validator,
  IconButton suffixButton,
  TextEditingController controller,
) =>
    Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 12,
            ),
            child: TextFormField(
              controller: controller,
              validator: validator,
              obscureText: isPassword,
              keyboardType:
                  isEmail ? TextInputType.emailAddress : TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  size: 18,
                ),
                suffixIcon: suffixButton,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(
                    25,
                  )),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(
                    25,
                  )),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
        ],
      ),
    );

Widget buildPressButton(VoidCallback? onPressed) => Container(
      height: 85,
      width: 85,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.4),
              spreadRadius: 1,
              blurRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.orange,
              ]),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          onPressed: onPressed,
        ),
      ),
    );
