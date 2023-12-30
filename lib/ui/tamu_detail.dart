import 'package:flutter/material.dart';
import 'package:tamuapp/bloc/tamu_bloc.dart';
import 'package:tamuapp/model/tamu.dart';
import 'package:tamuapp/ui/tamu_form.dart';
import 'package:tamuapp/ui/tamu_page.dart';
import 'package:tamuapp/widget/warning_dialog.dart';

class TamuDetail extends StatefulWidget {
  final Tamu tamu;

  TamuDetail({required this.tamu});

  @override
  _TamuDetailState createState() => _TamuDetailState();
}

class _TamuDetailState extends State<TamuDetail> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          title: Text(
            "INFO TAMU",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Nama",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("${widget.tamu.nama}")),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Jam",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("${widget.tamu.jam}")),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Alamat",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("${widget.tamu.alamat}")),
                ],
              ),
            ),
            SizedBox(height: 10),
            _tombolHapusEdit()
          ],
        ));
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TamuForm(tamu: widget.tamu),
              ),
            );
          },
          child: Text("EDIT"),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white),
          onPressed: () => confirmHapus(),
          child: Text("DELETE"),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = new AlertDialog(
      content: Text("Yakin mau dihapus ni?"),
      actions: [
        //tombol hapus
        ElevatedButton(
          child: Text("Ya"),
          onPressed: () {
            TamuBloc.deleteTamu(id: widget.tamu.id).then((value) {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => TamuPage()));
            }, onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => WarningDialog(
                        description: "Gagal, coba lagi nanti ya!",
                        okClick: () {},
                      ));
            });
          },
        ),
        //tombol batal
        ElevatedButton(
          child: Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }
}
