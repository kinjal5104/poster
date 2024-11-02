import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';

class PhonePePayment extends StatefulWidget {
  const PhonePePayment({super.key});

  @override
  State<PhonePePayment> createState() => _PhonePePaymentState();
}

class _PhonePePaymentState extends State<PhonePePayment> {
  String environment = "SANDBOX";
  String appId = "";
  String merchantId = "PGTESTPAYUAT86";
  bool enableLogging = true;
  String checksum = "";
  String saltKey = "96434309-7796-489d-8924-ab56988a6076";
  String saltIndex = "1";
  String callbackUrl = "https://webhook.site/f63d1195-f001-474d-acaa-f7bc4f3b20b1";
  String body = "";
  String apiEndPoint = "/pg/v1/pay";
  Object? result;

  // Function to generate checksum and return the base64 encoded body
  String generateChecksum() {
    final requestData = {
      "merchantId": merchantId,
      "merchantTransactionId": "transaction_123",
      "merchantUserId": "90223250",
      "amount": 1000,
      "mobileNumber": "9999999999",
      "callbackUrl": callbackUrl,
      "paymentInstrument": {
        "type": "PAY_PAGE",
      },
    };

    String base64Body = base64.encode(utf8.encode(json.encode(requestData)));
    checksum = '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltKey)).toString()}###$saltIndex';

    return base64Body;
  }

  @override
  void initState() {
    super.initState();
    phonePeInit();
    body = generateChecksum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ShopLocalia"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Set button color to green
                foregroundColor: Colors.white, // Set text color to white
              ),
              onPressed: () {
                startPgTransaction();
              },
              child: Text("Start Transaction"),
            ),
            const SizedBox(height: 20),
            Text("Result \n $result"),
          ],
        ),
      ),
    );
  }

  // Function to initialize PhonePe SDK
  void phonePeInit() {
    PhonePePaymentSdk.init(environment, appId, merchantId, enableLogging)
        .then((val) {
      setState(() {
        result = 'PhonePe SDK Initialized - $val';
      });
    }).catchError((error) {
      handleError(error);
    });
  }

  // Function to start the PhonePe transaction
  void startPgTransaction() async {
    try {
      var response = await PhonePePaymentSdk.startTransaction(
        body,
        callbackUrl,
        checksum,
        "",
      );

      setState(() {
        if (response != null) {
          String status = response["status"].toString();
          String error = response["error"]?.toString() ?? "No error";

          if (status == 'SUCCESS') {
            result = "Flow complete - status: SUCCESS";
          } else {
            result = "Flow complete - status: $status, error: $error";
          }
        } else {
          result = "Flow Incomplete";
        }
      });
    } catch (error) {
      handleError(error);
    }
  }

  // Error handling function
  void handleError(error) {
    setState(() {
      result = "Error: ${error.toString()}";
    });
  }
}
