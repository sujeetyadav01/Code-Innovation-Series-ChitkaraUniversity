import 'pdf_viewer_page.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;

reportView(context,List<List<int>> data) async {
  //List<List<int>> data =new List<List<int>>();
  List<List<String>> str;
  print("Length of list "+data.length.toString());
  List<int> num1,num2,num3;
  // str.add(data[0]);
  // str[0][1]=data[0][0].toString();
  // str[0][2]=data[0][0].toString();
  // for(int i=2;i<3;i++)
  //   str[]
  //  num1.add(data[i][0]);
  // for(int i=2;i<3;i++)
  //   num2.add(data[i][0]);
  // for(int i=2;i<3;i++)
  //   num3.add(data[i][0]);
  // for(int i=1;i<data.length;i++)
  //   <String>[data[i][1].toString(), data[i][1].toString(), data[i][1].toString()];
  print(data.toString());
  final Document pdf = Document();

  pdf.addPage(MultiPage(
      pageFormat:
      PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration:  BoxDecoration(
                border: BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Report',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Report', textScaleFactor: 2),
                  PdfLogo()
                ])),
        Header(level: 1, text: 'Blood Measure Data'),
          Padding(padding: const EdgeInsets.all(10)),
        Table.fromTextArray(context: context,
          data:
              <List<String>>[
            <String>['Type 1','Type 2','Type 3'],
            //<String>[num1.toString(),num2.toString(),num3.toString()],

          ]
        ),
        Table.fromTextArray(context: context,
            data: data,
        //     <List<String>>[
        //   <String>['Type 1','Type 2','Type 3'],
        //   //<String>[num1.toString(),num2.toString(),num3.toString()],
        //   str[0],
        //
        // ]
        ),
      ]));
  //save PDF

  final String dir = (await getApplicationDocumentsDirectory()).path;
  print(dir);
  final String path = '$dir/report.pdf';
  final File file = File(path);
  //final File file2=File('bloodReport.pdf');
  //await file2.writeAsBytes(pdf.save());
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path),
    ),
  );
}

