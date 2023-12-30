import 'package:flutter/material.dart';
import 'package:tamuapp/bloc/tamu_bloc.dart';
import 'package:tamuapp/model/tamu.dart';
import 'package:tamuapp/ui/tamu_page.dart';
import 'package:tamuapp/widget/warning_dialog.dart';

class TamuForm extends StatefulWidget {
  final Tamu? tamu;
  TamuForm({required this.tamu});
  @override
  _TamuFormState createState() => _TamuFormState();
}

class _TamuFormState extends State<TamuForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH JOB";
  String tombolSubmit = "SIMPAN";

  final _namaTamuTextBoxController = TextEditingController();
  final _jamTamuTextBoxController = TextEditingController();
  final _alamatTamuTextBoxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.tamu != null) {
      setState(() {
        judul = "TAMBAH LIST TAMU";
        tombolSubmit = "SUBMIT";
        _namaTamuTextBoxController.text = widget.tamu?.nama ?? '';
        _jamTamuTextBoxController.text = widget.tamu?.jam ?? '';
        _alamatTamuTextBoxController.text = widget.tamu?.alamat ?? '';
      });
    } else {
      judul = "PENCATATAN TAMU";
      tombolSubmit = "DAFTARIN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text(
          judul,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text("DAFTARKAN TAMU",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 20)),
                        SizedBox(height: 30),
                        _namaTamuTextField(),
                        _jamTamuTextField(),
                        _alamatTamuTextField(),
                        SizedBox(
                          height: 20,
                        ),
                        _buttonSubmit()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _namaTamuTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Nama",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        keyboardType: TextInputType.text,
        controller: _namaTamuTextBoxController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Eits blum diisi nich!";
          }
          return null;
        },
      ),
    );
  }

  Widget _jamTamuTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Jam",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        keyboardType: TextInputType.text,
        controller: _jamTamuTextBoxController,
        validator: (value) {
          if (value!.isEmpty) {
            return "jam nya gabole kosong dong!";
          }
          return null;
        },
      ),
    );
  }

  Widget _alamatTamuTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Alamat",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        controller: _alamatTamuTextBoxController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Gapunya rumah emang nya?";
          }
          return null;
        },
      ),
    );
  }

  Widget _buttonSubmit() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
        child: Text(tombolSubmit),
        onPressed: () {
          // Assuming _formKey is properly defined and associated with your Form widget
          if (_formKey.currentState!.validate()) {
            if (!_isLoading) {
              if (widget.tamu != null) {
                //kondisi update tamu
                ubah();
              } else {
                //kondisi tambah tamu
                simpan();
              }
            }
          }
        });
  }

  void simpan() {
    setState(() {
      _isLoading = true;
    });
    int? id = widget.tamu?.id;
    Tamu createTamu = Tamu(
        id: id ?? 0,
        nama: _namaTamuTextBoxController.text,
        jam: _jamTamuTextBoxController.text,
        alamat: _alamatTamuTextBoxController.text);
    createTamu.nama = _namaTamuTextBoxController.text;
    createTamu.jam = _jamTamuTextBoxController.text;
    createTamu.alamat = _alamatTamuTextBoxController.text;
    TamuBloc.addTamu(tamu: createTamu).then((value) {
      Navigator.of(context).push(
          new MaterialPageRoute(builder: (BuildContext context) => TamuPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => WarningDialog(
                description: "Simpan gagal, silahkan coba lagi",
                okClick: () {},
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });

    int? id = widget.tamu?.id;
    Tamu updateTamu = new Tamu(
        id: id ?? 0,
        nama: _namaTamuTextBoxController.text,
        jam: _jamTamuTextBoxController.text,
        alamat: _alamatTamuTextBoxController.text);
    updateTamu.nama = _namaTamuTextBoxController.text;
    updateTamu.jam = _jamTamuTextBoxController.text;
    updateTamu.alamat = _alamatTamuTextBoxController.text;
    TamuBloc.updateTamu(tamu: updateTamu).then((value) {
      Navigator.of(context).push(
          new MaterialPageRoute(builder: (BuildContext context) => TamuPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => WarningDialog(
                description: "Permintaan ubah data gagal, silahkan coba lagi",
                okClick: () {},
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
