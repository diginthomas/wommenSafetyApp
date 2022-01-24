import 'package:flutter/material.dart';
import 'package:call/backend.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreen createState() {
    return _UpdateScreen();
  }
}

class _UpdateScreen extends State<UpdateScreen> {
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(18),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red[400]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    Provider.of<Db>(context).user.phone,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            FlatButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          color: Colors.black54,
                          height: 400,
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(22),
                                    topRight: Radius.circular(22))),
                            child: Column(
                              children: [
                                TextField(
                                  keyboardType: TextInputType.phone,
                                  autofocus: true,
                                  controller: number,
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.phone),
                                  ),
                                ),
                                RaisedButton(
                                  onPressed: () async {
                                    await Provider.of<Db>(context,
                                            listen: false)
                                        .updateData(number.text);
                                    Navigator.pop(context);
                                  },
                                  color: Colors.red,
                                  child: Text("Save"),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                color: Colors.red[400],
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
