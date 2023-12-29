import 'package:flutter/material.dart';
import 'package:tamuapp/bloc/logout_bloc.dart';
import 'package:tamuapp/bloc/tamu_bloc.dart';
import 'package:tamuapp/model/tamu.dart';
import 'package:tamuapp/ui/login_page.dart';
import 'package:tamuapp/ui/tamu_detail.dart';
import 'package:tamuapp/ui/tamu_form.dart';

class TamuPage extends StatefulWidget {
  @override
  _TamuPageState createState() => _TamuPageState();
}

class _TamuPageState extends State<TamuPage> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'List Tamu Hadir',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.logout),
              onTap: () async {
                await LogoutBloc.logout().then(
                  (value) {
                    Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => LoginPage()));
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List>(
        future: TamuBloc.getTamus(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'cari',
                            hintText: 'cari nama tamu',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                            )),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 15, bottom: 5),
                      child: Text(
                        'Listed Job',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: ListTamu(
                          list: snapshot.data,
                          searchText: searchText,
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TamuForm(
                tamu: null,
              ),
            ),
          );
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListTamu extends StatelessWidget {
  final List? list;
  final String searchText;

  ListTamu({required this.list, required this.searchText});

  List<Tamu> getFilteredTamus() {
    if (searchText.isEmpty) {
      return list as List<Tamu>;
    } else {
      return (list as List<Tamu>).where((tamu) {
        return tamu.nama.toLowerCase().contains(searchText.toLowerCase()) ||
            tamu.jam
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Tamu> filteredList = getFilteredTamus();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, i) {
        return ItemTamu(
          tamu: filteredList[i],
        );
      },
    );
  }
}

class ItemTamu extends StatelessWidget {
  final Tamu tamu;

  ItemTamu({required this.tamu});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TamuDetail(
                tamu: tamu,
              ),
            ),
          );
        },
        child: ListTile(
          title: Text(
            tamu.nama,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            tamu.jam.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
