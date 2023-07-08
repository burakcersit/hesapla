import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HesapMakinesi(),
    );
  }
}

class HesapMakinesi extends StatefulWidget {
  @override
  _HesapMakinesiState createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  String _sonuc = '';
  double _sayi1 = 0;
  double _sayi2 = 0;
  String _operator = '';

  void _butonBasildi(String butonMetni) {
    setState(() {
      if (butonMetni == 'C') {
        _sonuc = '';
        _sayi1 = 0;
        _sayi2 = 0;
        _operator = '';
      } else if (butonMetni == '+' || butonMetni == '-' || butonMetni == '*' || butonMetni == '/') {
        _operator = butonMetni;
        _sayi1 = double.parse(_sonuc);
        _sonuc = '';
      } else if (butonMetni == '=') {
        _sayi2 = double.parse(_sonuc);
        if (_operator == '+') {
          _sonuc = (_sayi1 + _sayi2).toString();
        }
        if (_operator == '-') {
          _sonuc = (_sayi1 - _sayi2).toString();
        }
        if (_operator == '*') {
          _sonuc = (_sayi1 * _sayi2).toString();
        }
        if (_operator == '/') {
          _sonuc = (_sayi1 / _sayi2).toString();
        }
        _sayi1 = 0;
        _sayi2 = 0;
        _operator = '';
      } else {
        _sonuc += butonMetni;
      }
    });
  }

  Widget _butonOlustur(String butonMetni, double butonYukseklik, Color butonRengi) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * butonYukseklik,
      color: butonRengi,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        onPressed: () => _butonBasildi(butonMetni),
        child: Text(
          butonMetni,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Makinesi'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _sonuc,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: _butonOlustur('7', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('8', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('9', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('/', 1, Colors.orange),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: _butonOlustur('4', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('5', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('6', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('*', 1, Colors.orange),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: _butonOlustur('1', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('2', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('3', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('-', 1, Colors.orange),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: _butonOlustur('C', 1, Colors.red),
              ),
              Expanded(
                child: _butonOlustur('0', 1, Colors.grey),
              ),
              Expanded(
                child: _butonOlustur('=', 1, Colors.orange),
              ),
              Expanded(
                child: _butonOlustur('+', 1, Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
