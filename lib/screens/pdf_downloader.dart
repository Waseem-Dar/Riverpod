// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
//
// class PDFViewerPage extends StatefulWidget {
//   @override
//   _PDFViewerPageState createState() => _PDFViewerPageState();
// }
//
// class _PDFViewerPageState extends State<PDFViewerPage> {
//   String filePath = '';
//   PDFViewController? pdfController;
//
//   @override
//   void initState() {
//     super.initState();
//     // Provide the URL of the PDF you want to view here.
//     loadPDF('YOUR_PDF_URL_HERE');
//   }
//
//   Future<void> loadPDF(String pdfUrl) async {
//     filePath = await downloadPDF(pdfUrl);
//     setState(() {});
//   }
//
//   Future<String> downloadPDF(String pdfUrl) async {
//     final response = await http.get(Uri.parse(pdfUrl));
//
//     final documentsDirectory = await getApplicationDocumentsDirectory();
//     final filePath = join(documentsDirectory.path, 'sample.pdf');
//     final file = File(filePath);
//
//     await file.writeAsBytes(response.bodyBytes);
//
//     return filePath;
//   }
//
//   Future<void> openPDF() async {
//     final filePath = await downloadPDF('YOUR_PDF_URL_HERE');
//     if (pdfController != null) {
//       pdfController!.loadFile(filePath);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.download),
//             onPressed: openPDF,
//           ),
//         ],
//       ),
//       body: Center(
//         child: filePath.isEmpty
//             ? CircularProgressIndicator()
//             : PDFView(
//           filePath: filePath,
//           controller: pdfController,
//           onPageChanged: (page) {
//             // Handle page change if needed
//           },
//         ),
//       ),
//     );
//   }
// }