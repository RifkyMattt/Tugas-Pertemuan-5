import 'package:aplikasitest4/model/poli.dart';
import 'package:aplikasitest4/ui/poli_detail.dart';
import 'package:flutter/material.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({Key? key}) : super(key: key);
  _PoliFormState createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [_fieldNamaPoli(), SizedBox(height: 20), _tombolSimpan()],
          ),
        ),
      ),
    );
  }

  _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)),
          );
        }
      },
      child: const Text("Simpan"),
    );
  }
}
