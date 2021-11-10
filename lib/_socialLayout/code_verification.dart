import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class CodeVerification extends StatefulWidget {
  CodeVerification({Key? key}) : super(key: key);

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  String _code = "";

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            ClipOval(
              child: Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/code.jpg'),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            const Center(
              child: Text(
                'Verification',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                'Enter you code number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: PinFieldAutoFill(
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  colorBuilder:
                      FixedColorBuilder(Colors.black.withOpacity(0.3)),
                ),
                currentCode: _code,
                onCodeSubmitted: (code) {},
                onCodeChanged: (code) {
                  if (code!.length == 6) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(
            //     horizontal: 10,
            //   ),
            //   padding: EdgeInsets.all(28),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //   ),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           buildOTP(first: true, last: false),
            //           buildOTP(first: false, last: false),
            //           buildOTP(first: false, last: false),
            //           buildOTP(first: false, last: true),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 35),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    primary: Colors.white,
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () async {
                    await SmsAutoFill().listenForCode;
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(letterSpacing: 2.3, fontSize: 14),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOTP({bool? first, last}) => Container(
        height: 85,
        child: AspectRatio(
          aspectRatio: .7,
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.purple),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      );
}
