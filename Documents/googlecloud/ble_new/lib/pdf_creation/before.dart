import 'package:ble_new/model.dart';
import 'package:flutter/material.dart';
import 'newReport.dart';
class beforeFunc extends StatefulWidget {
  @override
  List<TempData> tables1;
  beforeFunc({this.tables1});
  _beforeFuncState createState() => _beforeFuncState();
}

var fontsize=11.00;

class _beforeFuncState extends State<beforeFunc> {
  @override






  List<TempData> _generatePDFData() {
    return widget.tables1;

    //   [
    //   {"userId": 1, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 2, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 3, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 4, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 5, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 6, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 7, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 8, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 9, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 10, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 1, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 2, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 3, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 4, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 5, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 6, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 7, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 8, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 9, "name": "John Doe", "email": "john@john.com"},
    //   {"userId": 10, "name": "John Doe", "email": "john@john.com"},
    // ];
  }

  Widget makeBody() {
    return SingleChildScrollView(

        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width*0.90,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(top:8.0,left: 20),
                  child: Text("Data Report",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.90,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(top:8.0,left: 20),
                  child: Text("File Information",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),),
                ),
              ),
              //new Divider(color: Colors.red,),
              //SizedBox(height:0,),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width*0.90,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(top:8.0,left: 20),
                  child: Text("File created time:10-12-2000 4:53",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: fontsize,
                    ),),
                ),
              ),
              SizedBox(height:10,),
              //new Divider(color: Colors.red,thickness: 2,height: 10,),


              Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.90,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(top:8.0,left:20),
                  child: Text("Device Information",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),),
                ),
              ),
              //new Divider(color: Colors.red,),
              //SizedBox(height:0,),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width*0.90,
                alignment: Alignment.center,
                child: Padding(
                  padding:  EdgeInsets.only(top:8.0,left:20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Device Type: AmbiTag",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                          Text("FirmWare Version:1.2 ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Id: 222277820508",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Start Delay: 00 hours 00 minutes",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                          Text("Log Interval: 00 hours 02 minutes",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Description: Temp Recorded",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
             // new Divider(color: Colors.red,thickness: 2,height: 10,),

              Container(
                height: 30,
                width: MediaQuery.of(context).size.width*0.90,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(top:8.0,left: 20),
                  child: Text("Login Summary",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),),
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width*0.90,
                alignment: Alignment.center,
                child: Padding(
                  padding:  EdgeInsets.only(top:8.0,left:20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("First Programme: 18-01-2021 15:23:59",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                          Text("Max: 33.500000 C",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Stop Time: 18-01-2021 15:23:59",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                          Text("Min: 33.500000 C",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Number Of Points: 15973",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                          Text("Average: 29.521454",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Trip Length: 22 d 04 h 26 m",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                          Text("MKT: 29.530075 C",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: fontsize,
                            ),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              DataTable(
                headingRowHeight: 30,
                columnSpacing: 15,
                dataRowHeight: 35,
                sortAscending: true,
                columns: tableColumns(),
                rows: List.generate(
                  _generatePDFData().length,
                      (index) => _getDataRow(_generatePDFData()[index]),
                ),
              ),
            ],
          ),
        ));
  }


  //_dataRow function will populate the table rows
  DataRow _getDataRow(TempData data) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(
          data.num.toString(),
          style: TextStyle(fontSize: 14),
        )),
        DataCell(Text(
          data.date.toString(),
          style: TextStyle(fontSize: 14),
        )),
        DataCell(Text(
          data.temp.toString(),
          style: TextStyle(fontSize: 14),
        ),),
        DataCell(Text(
          data.time.toString(),
          style: TextStyle(fontSize: 14),
        ),

        ),
      ],
    );
  }

  //function to populate table columns
  List<DataColumn> tableColumns() {
    return [
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "S.No",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "Date",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "Temperature",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ), DataColumn(
        label: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Text(
            "time",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      )
    ];
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body:(widget.tables1!=null)?
      makeBody():Container(child:Text("No Data Available")),
      floatingActionButton:  FloatingActionButton(
        onPressed: () async {
      // List<List<int>> data2 = new List<List<int>>();
      // print(data.toString());
      // for (int i = 0; i < data.length; i++) {
      //   List<int> data3 = new List<int>();
      //   for (int j = 0; j < 3; j++) {
      //     await data3.add(data[i][j]);
      //     //data2[i][j]=widget.data[i][j];
      //   }
      //   data2.add(data3);
      // }
      // print(data[1].toString());
      //reportView(context);
          var columns=["num","Date","Temp","Time"];
          generatePDF(columns,_generateTableData(),context).then((value) {
            if(value)
              showSuccessToast();
            else
              showErrorToast();
          });
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => beforeFunc()));
    },
        child: Icon(Icons.download_sharp),
      )

      // FlatButton(
      //     onPressed: () {
      //
      //       var columns=["Id","Name","Email"];
      //       generatePDF(columns,_generatePDFData()).then((value) {
      //         if(value)
      //           showSuccessToast();
      //         else
      //           showErrorToast();
      //       });
      //     },
      //     child: Text(
      //       "Export PDF",
      //       style: TextStyle(color: Colors.white),
      //     )),


    );


  }

  _generateTableData(){
    List<List<String>> data=new List();
    for(TempData d in  _generatePDFData())
       data.add(<String>[d.num.toString(),d.date,d.temp,d.time]);
    // data.add(d);
    return data;
  }

}
