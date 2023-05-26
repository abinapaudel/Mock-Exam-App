// import 'package:flutter/material.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';

// class KhaltiPayment extends StatefulWidget {
//   const KhaltiPayment({super.key});

//   @override
//   State<KhaltiPayment> createState() => _KhaltiPaymentState();
// }

// class _KhaltiPaymentState extends State<KhaltiPayment> {
//   TextEditingController _amountController = TextEditingController();
//   int amount = 0;

//   // final config = PaymentConfig(
//   // amount: 1000, // Amount should be in paisa
//   // productIdentity: 'dell-g5-g5510-2021',
//   // productName: 'Dell G5 G5510 2021',
//   // productUrl: 'https://www.khalti.com/#/bazaar',
//   // additionalData: {
//   //   // Not mandatory; can be used for reporting purpose
//   //   'vendor': 'Khalti Bazaar',
//   // },
//   // mobile:
//   //     '9800000001', // Not mandatory; can be used to fill mobile number field
//   // mobileReadOnly: true, // Not mandatory; makes the mobile field not editable
// // );
//   @override
//   Widget build(BuildContext context) {
//     _amountController.text = '800';

//     return Column(
//       children: [
//         TextField(
//           controller: _amountController,
//           decoration: InputDecoration(
//             hintText: 'Enter amount',
//             label: Text("Amount"),
//           ),
//         ),
//         KhaltiButton(
//           config: PaymentConfig(
//             amount: 10000,
//             productIdentity: 'dell-g5-g5510-2021',
//             productName: 'Dell G5s G5510 2021',
//           ),
//           preferences: [
//             // Not providing this will enable all the payment methods.
//             PaymentPreference.khalti,
//             PaymentPreference.eBanking,
//           ],
//           onSuccess: (successModel) {

//             showDialog(
//                 context: context,
//                 builder: ((context) {
//                   return AlertDialog(
//                     title: Text('Success'),
//                     content: Text('Payment successful'),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text('OK'),
//                       ),
//                     ],
//                   );
//                 }));
//             // Navigator.push(context, route)
//             // Perform Server Verification
//           },
//           onFailure: (failureModel) {
//             showDialog(
//                 context: context,
//                 builder: ((context) {
//                   return AlertDialog(
//                     title: Text('Failure'),
//                     content: Text('Payment failed'),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text('OK'),
//                       ),
//                     ],
//                   );
//                 }));
//             // What to do on failure?
//           },
//           onCancel: () {
//             showDialog(
//                 context: context,
//                 builder: ((context) {
//                   return AlertDialog(
//                     title: Text('Cancel'),
//                     content: Text('Payment cancelled'),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text('OK'),
//                       ),
//                     ],
//                   );
//                 }));

//             // User manually cancelled the transaction
//           },
//         ),
//       ],
//     );
//   }
// }
