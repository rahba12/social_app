import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

Widget defaultButton({
  double height = 40,
  double width = double.infinity,
  Color background = Colors.blue,
  required Function() onPressedButton,
  required String text,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onPressedButton,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget defaultButton2({
  required Function() onPressedButton,
  required String text,
}) =>
    ElevatedButton(
        onPressed: onPressedButton,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.brown),
          fixedSize: MaterialStateProperty.resolveWith(
              (states) => const Size(200, 30)),
          elevation: MaterialStateProperty.resolveWith(
            (states) => 20,
          ),
        ));

Widget defaultSearchTextFormField({
  required TextEditingController controller,
  @required onChange,
}) =>
    TextFormField(
      cursorRadius: const Radius.circular(20),
      cursorColor: Colors.black,
      onChanged: onChange,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'search',
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        // border: InputBorder.none,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            10,
          )),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.black12,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            10,
          )),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.black12,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 18,
        ),
      ),
    );

Widget dividerLine() => Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Divider(
        height: 3,
        thickness: 2,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => widget(),
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget(),
      ),
      (Route<dynamic> route) => false,
    );

Widget buildPressButton(Function()? onPressed) => Container(
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
                Colors.orange,
                Colors.red,
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
