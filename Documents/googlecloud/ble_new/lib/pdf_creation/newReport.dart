


import 'package:ble_new/model.dart';
import 'package:ble_new/pdf_creation/pdf_viewer_page.dart';
import 'package:flutter/material.dart' as material;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

const PdfColor green = PdfColor.fromInt(0xffe06c6c); //darker background color
const PdfColor lightGreen =
PdfColor.fromInt(0xffedabab); //light background color

const _darkColor = PdfColor.fromInt(0xff242424);
const _lightColor = PdfColor.fromInt(0xff9D9D9D);
const PdfColor baseColor = PdfColor.fromInt(0xffD32D2D);
const PdfColor _baseTextColor = PdfColor.fromInt(0xffffffff);
const PdfColor accentColor = PdfColor.fromInt(0xfff1c0c0);


//create pdf file
Future<bool>generatePDF( List<String> columns, List<List<String>> tableData,var context)  async {
  final PageTheme pageTheme = await _myPageTheme(PdfPageFormat.a3);

  Widget headerWidget=pdfHeader();

  final Document pdf = Document();
  pdf.addPage(MultiPage(
      pageTheme: pageTheme,
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container();
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
        Header(
          level: 0,
          child: headerWidget,
        ),

        Header(level: 1, text: 'What is Lorem Ipsum?'),
        Paragraph(
            text:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
        Paragraph(
            text:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using "Content here, content here", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for "lorem ipsum" will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
        Header(level: 1, text: 'Where does it come from?'),
        Paragraph(
            text:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
        Paragraph(
            text:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
        Padding(padding: const EdgeInsets.all(10)),
        Table.fromTextArray(
          context: context,
          border: null,
          headerAlignment: Alignment.centerLeft,
          cellAlignment: Alignment.centerLeft,
          headerDecoration: BoxDecoration(
            borderRadius: 2,
            color: baseColor,
          ),
          headerHeight: 25,
          cellHeight: 30,
          headerStyle: TextStyle(
            color: _baseTextColor,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          cellStyle: const TextStyle(
            color: _darkColor,
            fontSize: 10,
          ),
          rowDecoration: BoxDecoration(
            border: BoxBorder(
              bottom: true,
              color: accentColor,
              width: .5,
            ),
          ),

          headers: List<String>.generate(
            columns.length,
                (col) {
              return columns[col];
            },
          ),
          data: List<List<String>>.generate(
            tableData.length,
                (row) => List<String>.generate(
              columns.length,
                  (col) {
                return tableData[row][col];
              },
            ),
          ),
        ),
      ]));

  try {
    // Directory dir = await getExternalStorageDirectory();
    // String filePath = dir.path + "/devbybit/";
    // if (Directory(filePath).exists() != true) {
    //   new Directory(filePath).createSync(recursive: true);
    //   final File file = File(filePath + "sample.pdf");
    //   file.writeAsBytesSync(pdf.save());
    //   return true;
    // } else {
    //   final File file = File(filePath + "sample.pdf");
    //   file.writeAsBytesSync(pdf.save());
    //   return true;
    // }

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/report.pdf';
    final File file = File(path);
    await file.writeAsBytes(pdf.save());
    material.Navigator.of(context).push(
      material.MaterialPageRoute(
        builder: (_) => PdfViewerPage(path: path),
      ),
    );
  } catch (e) {
    return false;
  }

}


showSuccessToast() {
  Fluttertoast.showToast(
      msg:
      "Your file has been exported successfully.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 60,
      backgroundColor: material.Colors.blueAccent,
      textColor: material.Colors.white,
      fontSize: 16.0);
}

showErrorToast() {
  Fluttertoast.showToast(
      msg: "Exporting your file failed. Nothing was downloaded.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 60,
      backgroundColor: material.Colors.redAccent,
      textColor: material.Colors.white,
      fontSize: 16.0);
}
//pdf document theme
Future<PageTheme> _myPageTheme(PdfPageFormat format) async {
  return PageTheme(
    pageFormat: format.applyMargin(
        left: 2.0 * PdfPageFormat.cm,
        top: 4.0 * PdfPageFormat.cm,
        right: 2.0 * PdfPageFormat.cm,
        bottom: 2.0 * PdfPageFormat.cm),
    theme: ThemeData.withFont(
//      base: pw.Font.ttf(await rootBundle.load('assets/fonts/nexa_bold.otf')),
//      bold:
//          pw.Font.ttf(await rootBundle.load('assets/fonts/raleway_medium.ttf')),
    ),
    buildBackground: (Context context) {
      return FullPage(
        ignoreMargins: true,
        child: CustomPaint(
          size: PdfPoint(format.width, format.height),
          painter: (PdfGraphics canvas, PdfPoint size) {
            context.canvas
              ..setColor(lightGreen)
              ..moveTo(0, size.y)
              ..lineTo(0, size.y - 230)
              ..lineTo(60, size.y)
              ..fillPath()
              ..setColor(green)
              ..moveTo(0, size.y)
              ..lineTo(0, size.y - 100)
              ..lineTo(100, size.y)
              ..fillPath()
              ..setColor(lightGreen)
              ..moveTo(30, size.y)
              ..lineTo(110, size.y - 50)
              ..lineTo(150, size.y)
              ..fillPath()
              ..moveTo(size.x, 0)
              ..lineTo(size.x, 230)
              ..lineTo(size.x - 60, 0)
              ..fillPath()
              ..setColor(green)
              ..moveTo(size.x, 0)
              ..lineTo(size.x, 100)
              ..lineTo(size.x - 100, 0)
              ..fillPath()
              ..setColor(lightGreen)
              ..moveTo(size.x - 30, 0)
              ..lineTo(size.x - 110, 50)
              ..lineTo(size.x - 150, 0)
              ..fillPath();
          },
        ),
      );
    },
  );
}

//pdf header body
Widget pdfHeader() {
  return Container(
      decoration: const BoxDecoration(
          color: PdfColor.fromInt(0xffffffff), borderRadius: 6),
      margin: const EdgeInsets.only(bottom: 8, top: 8),
      padding: const EdgeInsets.fromLTRB(10, 7, 10, 4),
      child: Column(children: [
        Text(
          "ScratchNest",
          style: TextStyle(
              fontSize: 16, color: _darkColor, fontWeight: FontWeight.bold),
        ),
        Text("Temperature Report",
            style: TextStyle(fontSize: 14, color: _darkColor)),
        Text("IIT, Ropar",
            style: TextStyle(fontSize: 14, color: _darkColor)),
        Divider(color: accentColor),

      ]));
}









