import 'package:app_working/components/imc_textformfild.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({Key? key}) : super(key: key);

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final _heighController = TextEditingController();
  final _weightController = TextEditingController();

  final _formekey = GlobalKey<FormState>();

  String infoTextImc = "Informe seus dados!";
  String infoIdealWeight = "";

  void _resetFormImc() {
    _heighController.text = "";
    _weightController.text = "";
    infoIdealWeight = "";
    setState(() {
      infoTextImc = "Informe seus dados!";
    });
  }

  void _calculateIMC() {
    setState(() {
      double height = double.parse(_heighController.text);
      double weight = double.parse(_weightController.text);
      double result = (weight / (height * height));
      double idealWeight = (((height * 100) - 100) * 0.90);
      if (result > 1) {
        if (result < 18.5) {
          infoTextImc =
              "IMC:${result.toStringAsFixed(2)}, Abaixo do peso! Magreza";
        } else if (result > 18.5 && result <= 24.9) {
          infoTextImc = "IMC:${result.toStringAsFixed(2)}, Normal!";
        } else if (result > 25.0 && result <= 29.9) {
          infoTextImc =
              "IMC:${result.toStringAsFixed(2)}, Sobrepeso! Obesidade grau I";
        } else if (result > 30.0 && result <= 39.9) {
          infoTextImc = "IMC:${result.toStringAsFixed(2)}, Obesidade grau II";
        } else {
          infoTextImc =
              "IMC:${result.toStringAsFixed(2)}, Obesidade grave, grau III";
        }
        infoIdealWeight =
            "Peso idel para é ${idealWeight.toStringAsFixed(2)}kg";
      } else {
        infoTextImc = "Informe dados válidos";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IMC"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _resetFormImc,
            icon: const Icon(
              Icons.replay_outlined,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formekey,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                child: Icon(
                  Icons.person_outline_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 160.0,
                ),
              ),
              TextFormFieldWiget(
                controller: _weightController,
                textInputAction: TextInputAction.next,
                label: "Peso kg",
                prefix: "kg ",
                hintText: "",
                keyboardType: TextInputType.number,
                validator: 'Informe seu peso',
              ),
              TextFormFieldWiget(
                controller: _heighController,
                textInputAction: TextInputAction.done,
                label: "Altura m",
                prefix: "m ",
                hintText: "",
                keyboardType: TextInputType.number,
                validator: 'Informe sua altura',
                //answers: 'Valor invalido',
              ),
              Container(
                height: 60,
                width: 700,
                padding: const EdgeInsets.only(
                    left: 20, top: 8.0, right: 20.0, bottom: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formekey.currentState?.validate() ?? false) {
                      _calculateIMC();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                    shadowColor: Colors.greenAccent,
                    onSurface: Colors.amber,
                    elevation: 10,
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "$infoTextImc ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 10),
              Text(
                "$infoIdealWeight ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
