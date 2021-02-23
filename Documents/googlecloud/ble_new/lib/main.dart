import 'dart:typed_data';

import 'package:ble_new/notifier.dart';
import 'package:ble_new/pdf_creation/report_pdf.dart';
import 'package:convert/convert.dart';
/// Flutter code sample for TabController

// This example shows how to listen to page updates in [TabBar] and [TabBarView]
// when using [DefaultTabController].

import 'package:flutter/material.dart' as material;

import 'dart:convert';
import 'package:path_provider/path_provider.dart';
//import 'package:ble/pdf_creation/report_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';

List<Container> containers2 = new List<Container>();
bool shor=false;
final FlutterBlue flutterBlue = FlutterBlue.instance;
final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
final Map<Guid, String> readValues = new Map<Guid, String>();
Guid indexOfButton;
List<List<int>> data =new List<List<int>>();
List<List<int>> fetchTable =new List<List<int>>();
BluetoothCharacteristic mainDevice;
BluetoothDevice _connectedDevice;
List<BluetoothService> _services;
String conn="Connect";


bool seected=false;

void main() => runApp(
    MultiProvider(
        providers: [

          ChangeNotifierProvider(
            create: (context) => BleNotifier(),
          ),
        ],
        child:MyApp()
    ));

/// This is the main application widget.
class MyApp extends material.StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends material.State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            title: Text("Ble"),
            actions: [
              //Icon(Icons.file_upload),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                 child: GestureDetector(
                //   onTap: ()async{
                //     await widget.flutterBlue.stopScan();
                //     widget.flutterBlue.stopScan();
                //     // widget.scanSubScription?.cancel();
                //     // widget.scanSubScription = null;
                //     setState(() {
                //
                //       widget.devicesList.clear();
                //       scanFunction();
                //     });
                //
                //   },
                  child: Center(child: Text('Scan',style: material.TextStyle(
                    fontSize: 20,
                  ))),
                 ),
              ),
              Icon(Icons.more_vert),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: "Scanner"),
                Tab(text: "Bonded")
              ],
            ),
            backgroundColor: Colors.black87,
          ),
          body: TabBarView(
            children: [
              MyStatelessWidget(dec:true),
              Tab2(),
            ],
          ),
        ),
      ),
    );
  }
}


final List<Function> tabs = <Function>[

  //Tab(text: 'Scanner'),
  //Tab(text: 'Bonded'),
  //Tab(text: 'Second'),
];

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatefulWidget {
  //MyStatelessWidget({Key key}) : super(key: key);
  bool dec;
  MyStatelessWidget({this.dec});
  //final String title;


  @override
  _MyStatelessWidgetState createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {


  final List<Function> tabs = <Function>[

    //Tab(text: 'Scanner'),
    //Tab(text: 'Bonded'),
    //Tab(text: 'Second'),
  ];


  final _writeController = TextEditingController();


  _addDeviceTolist(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      setState(() {
        devicesList.add(device);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scanFunction();
    //dataindertion();
  }


  void scanFunction(){
    flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
   flutterBlue.startScan();
  }
  dataindertion (){
    List<int> arr=new List<int>();
    arr.add(34);
    arr.add(32);
    arr.add(76);
    arr.add(34);
    arr.add(32);
    arr.add(76);
    arr.add(34);
    arr.add(32);
    arr.add(76);
    arr.add(34);
    arr.add(32);
    arr.add(76);
    data.add(arr);
   // widget.data.add(arr);

  }



  ListView _buildListViewOfDevices() {
    List<Container> containers = new List<Container>();
    for (BluetoothDevice device in devicesList) {
      containers.add(
        Container(
          height: 55,
          child: Row(
            children: <Widget>[
              Container(
                width: 40,
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  //fillColor: Colors.white,
                  child: Icon(
                    Icons.bluetooth_audio,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(0),
                  //shape: CircleBorder(),
                ),
              ),


              Expanded(
                child:
                material.Padding(
                  padding:  EdgeInsets.only(top:12.0,left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          alignment:Alignment.centerLeft,
                          child: Text(device.name,textAlign: TextAlign.start,style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),)),
                      Container(
                          alignment:material.Alignment.centerLeft,child: Text(device.id.toString(),style: TextStyle(
                        fontSize: 10,

                      ))),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right:16.0),
                child: FlatButton(
                  color: Colors.black,
                  height: 30,
                  child: Text(
                    conn.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                   flutterBlue.stopScan();
                   if(conn=="Conect")
                     {
                       setState(() {
                         conn="Disconnect";
                       });
                     }
                   else
                     {
                       setState(() {
                         conn="Connect";
                       });
                     }
                    try {
                      await device.connect();
                    } catch (e) {
                      if (e.code != 'already_connected') {
                        throw e;
                      }
                    } finally {
                      _services = await device.discoverServices();
                    }
                    setState(() {
                      _connectedDevice = device;
                    });
                   DefaultTabController.of(context).animateTo(1);
                  },
                ),
              ),
              // material.FlatButton(
              //   color: Colors.blue,
              //   onPressed: (){}, child: Icon(
              //   Icons.more_vert,
              //   size: 35.0,
              // ),minWidth: 4,)
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }

















  ListView _buildView() {
    // if (_connectedDevice != null) {
    //   return _buildConnectDeviceView();
    // }
    return _buildListViewOfDevices();
  }








  @override
  Widget build(BuildContext context) => Scaffold(

    // appBar: AppBar(
    //
    //   leading: Icon(Icons.menu),
    //   title: Text("hello"),
    //   actions: [
    //     //Icon(Icons.file_upload),
    //     Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 16),
    //       child: GestureDetector(
    //         onTap: ()async{
    //           await widget.flutterBlue.stopScan();
    //           widget.flutterBlue.stopScan();
    //           // widget.scanSubScription?.cancel();
    //           // widget.scanSubScription = null;
    //           setState(() {
    //
    //             widget.devicesList.clear();
    //             scanFunction();
    //           });
    //
    //         },
    //         child: Center(child: Text('Scan',style: material.TextStyle(
    //           fontSize: 20,
    //         ))),
    //       ),
    //     ),
    //     Icon(Icons.more_vert),
    //   ],
    //   backgroundColor: Colors.black87,
    // ),
    body: //_buildView(),
     _buildView()
  );
}


class Tab2 extends StatefulWidget {
  @override
  Widget container;
  Tab2({this.container});
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override









  List<ButtonTheme> _buildReadWriteNotifyButton(
      BluetoothCharacteristic characteristic) {
    List<ButtonTheme> buttons = new List<ButtonTheme>();

    if (characteristic.properties.read) {
      buttons.add(
        ButtonTheme(
          minWidth: 10,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: RaisedButton(
              color: Colors.black54,
              child: Text('  Read   ', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                var sub = characteristic.value.listen((value) {

                  print(characteristic.value.toString()+"  this is the read character");
                  if(value.toString()=="00001800-0000-1000-8000-00805f9b34fb")
                    mainDevice=characteristic;
                  setState(() {
                    print(value);
                    readValues[characteristic.uuid] = value.toString();
                  });
                });
                await characteristic.read();
                sub.cancel();
              },
            ),
          ),
        ),
      );
    }
    if (characteristic.properties.write) {
      buttons.add(
        ButtonTheme(
          minWidth: 10,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: RaisedButton(
              color: Colors.black54,
              child: Text('  Write   ', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Choose"),
                        // content: Row(
                        //   children: <Widget>[
                        //     // Expanded(
                        //     //   child: TextField(
                        //     //     controller: _writeController,
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Start"),
                            onPressed: () {
                              characteristic.write(
                                  utf8.encode("3"));
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text("Stop"),
                            onPressed: () {
                              characteristic.write([0x00]);
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ),
      );
    }
    if (characteristic.properties.notify) {
      buttons.add(
        ButtonTheme(
          minWidth: 10,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: RaisedButton(
              color: Colors.black54,
              child: Text('  Notify   ', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                //if(!characteristic.isNotifying) {
                 // await characteristic.setNotifyValue(true);
                  characteristic.value.listen((value) async {
                    var value1 = hex.encode(value);
                    print("The values of coverted list" + value1.toString());
                    print("notify Values");
                    print(value);
                    setState(() {
                      readValues[characteristic.uuid] = value1;
                      print("notify Values");
                      print(value);
                      indexOfButton = characteristic.uuid;
                      //for(int i=0;i<value.length;i++)
                      // if(value.length<3)
                      // {
                      //   value.add(23);
                      //   value.add(53);
                      //   value.add(78);
                      // }

                    });
                    if (!(value.length <= 0))
                      await data.add(value);
                    print("\n values in data" + data.toString());
                  });
                // }
                // else
                // {
                  await characteristic.setNotifyValue(!characteristic.isNotifying);
                // }
              },
            ),
          ),
        ),
      );
    }
    if (characteristic.properties.indicate) {
      buttons.add(
        ButtonTheme(
          minWidth: 1,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: RaisedButton(
              color: Colors.black54,
              child: Text('Indicate', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                characteristic.value.listen((value) {
                  setState(() {
                    readValues[characteristic.uuid] = value.toString();
                    print(value);
                    indexOfButton=characteristic.uuid;
                    //for(int i=0;i<value.length;i++)
                    if(value.length<3)
                    {
                      value.add(23);
                      value.add(53);
                      value.add(78);
                    }
                    if(value!=null)
                      data.add(value);
                    print("\n values in data"+data.toString());
                  });

                });
                await characteristic.setNotifyValue(true);
              },
            ),
          ),
        ),
      );
    }

    return buttons;
  }

  ListView _buildConnectDeviceView() {
    List<Container> containers = new List<Container>();

    for (BluetoothService service in _services) {
      List<Widget> characteristicsWidget = new List<Widget>();
      print(service.uuid);
      print("11111-" + service.uuid.toString());
      if (service.uuid.toString() == 'f3641400-00b0-4240-ba50-05ca45bf8abc')
        for (BluetoothCharacteristic characteristic in service
            .characteristics) {
          print('service uid' + characteristic.uuid.toString());
          print("22222-" + characteristic.uuid.toString());
          if (characteristic.uuid.toString() ==
              'f3641401-00b0-4240-ba50-05ca45bf8abc')
            characteristicsWidget.add(
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(characteristic.uuid.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        ..._buildReadWriteNotifyButton(characteristic),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        // material.Padding(
                        //padding: EdgeInsets.only(left:0.0),
                        //child:
                        Container(
                          //height: 100,
                          child: Text(
                            //'Value: ' +
                            readValues[characteristic.uuid].toString() +
                                "\n", style: material.TextStyle(fontSize: 10),
                            //+widget.readValues[characteristic.uuid].length.toString()
                          ),
                        ),
                        //),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            );
          //characteristic.write([0x1525,0x1524]);
        }
      print("33333" + service.uuid.toString());
      if (service.uuid.toString() == 'f3641400-00b0-4240-ba50-05ca45bf8abc') {
        containers.add(
          Container(
            child: ExpansionTile(
                title: Text("Temerature Parameter", style: material.TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: material.FontWeight.bold),),
                children: characteristicsWidget),
          ),
        );

        setState(() {
          containers2.add(
            Container(
              child: ExpansionTile(
                  title: Text("Temerature Parameter", style: material.TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: material.FontWeight.bold),),
                  children: characteristicsWidget),
            ),
          );
          shor=true;
        });
      }
    }






    return ListView(
      padding: EdgeInsets.only(left:10),
      children: <Widget>[
        ...containers,


        material.Row(
          children: [
            FlatButton(
              height: 40,
              minWidth: 1,
              color: Colors.black54,
              onPressed: () async{
                //List videos=
                if(seected==false)
                {
                  fetchTable.clear();
                  print(data.toString());
                  for(int i=0;i<data.length;i++)
                  {
                    List<int> data3=new List<int>();
                    for(int j=0;j<3;j++)
                    {
                      await data3.add(data[i][j]);
                      //data2[i][j]=widget.data[i][j];
                    }

                    setState(() {
                      fetchTable.add(data3);
                    });



                  }
                }

                for(int k=0;k<fetchTable.length;k++)
                  for(int m=0;m<fetchTable[0].length;m++)
                    print("VAlue for tables: "+fetchTable[k][m].toString());
                // widget.fetchTable.add(1);
                // widget.fetchTable.add(2);
                // widget.fetchTable.add(3);
                setState(() {
                  //widget.fetchTable=widget.fetchTable;
                  seected = !seected;
                });
              },
              child: (seected==false)?Text("Fetch Data",style: material.TextStyle(color: Colors.white),):Text("Hide Data"),
            ),
            material.SizedBox(width: 30,),
            FlatButton(
                height: 40,
                minWidth:100,
                color: Colors.white,
                onPressed: () async{
                  print(mainDevice.value.toString());
                  var sub = mainDevice.value.listen((value) {

                    print(mainDevice.value.toString()+" debugging");
                    setState(() {
                      print(value);
                      readValues[mainDevice.uuid] = value.toString();
                    });
                  });
                  await mainDevice.read();
                  sub.cancel();
                }, child: Text('Start',style: material.TextStyle(color: Colors.black),)
            ),
            material.SizedBox(width: 30,),
            FlatButton(
                height: 40,
                minWidth: 1,
                color: Colors.black54,
                onPressed: () async{
                  List<List<int>> data2 =new List<List<int>>();
                  print(data.toString());
                  for(int i=0;i<data.length;i++)
                  {
                    List<int> data3=new List<int>();
                    for(int j=0;j<3;j++)
                    {
                      await data3.add(data[i][j]);
                      //data2[i][j]=widget.data[i][j];
                    }
                    data2.add(data3);
                  }
                  print(data[1].toString());
                  reportView(context,data2);
                }, child: Text("Get Report",style: material.TextStyle(color: Colors.white),)
            ),


          ],
        ),

        Visibility(
            visible: seected,
            child: (seected==null)?Text("There is no data"):
            //Text(widget.data.toString()),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Table(
                // border: TableBorder.all(color: Colors.black),
                  children: [
                    for (var video in fetchTable) TableRow(children: [
                      TableCell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            for (var vr in video)
                              new Text(vr.toString(),style: material.TextStyle(fontWeight: material.FontWeight.bold),),
                            //new Text(video.toString()),
                          ],
                        ),
                      )
                    ])
                  ]
              ),
            )
        ),


      ],
    );
  }















  Widget build(BuildContext context) {
    return _connectedDevice != null?_buildConnectDeviceView():Container(child:Text("Empty"));
  }
}

