import 'package:flutter/material.dart';
import 'package:tamuapp/bloc/login_bloc.dart';
import 'package:tamuapp/helpers/user_info.dart';
import 'package:tamuapp/ui/tamu_page.dart';
import 'package:tamuapp/widget/warning_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextBoxController = TextEditingController();
  final _passwordTextBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("PENDAFTARAN TAMU",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "WELCOME ADMIN",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ),
                _emailTextField(),
                _passwordTextField(),
                _buttonLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Username",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        maxLines: 5,
        minLines: 1,
        keyboardType: TextInputType.text,
        controller: _emailTextBoxController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Nama Belum diisi";
          }
          return null;
        },
      ),
    );
  }

  Widget _passwordTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 25),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: _passwordTextBoxController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password harus diisi";
          }
          return null;
        },
      ),
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
      child: Text("MASUK"),
      onPressed: () {
        // Assuming _formKey is properly defined and associated with your Form widget
        if (_formKey.currentState!.validate()) {
          if (!_isLoading) _submit();
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
          textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }

  void _submit() {
    _formKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    LoginBloc.login(
            email: _emailTextBoxController.text,
            password: _passwordTextBoxController.text)
        .then((value) async {
      await UserInfo().setToken(value.token);
      await UserInfo().setUserID(value.userID);
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => TamuPage()));
    }, onError: (error) {
      print(error);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => WarningDialog(
                description: "Login gagal, silahkan coba lagi",
                okClick: () {},
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
