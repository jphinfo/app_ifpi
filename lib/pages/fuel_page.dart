import 'package:flutter/material.dart';

import '../components/textFormField_widget.dart';
import '../core/app_colors.dart';
import '../core/app_images.dart';

class FuelWidget extends StatefulWidget {
  const FuelWidget({super.key});

  @override
  State<FuelWidget> createState() => _FuelWidgetState();
}

class _FuelWidgetState extends State<FuelWidget> {
  final _gasolineController = TextEditingController();
  final _alcoholController = TextEditingController();

  final _formeKey = GlobalKey<FormState>();

  //GlobalKey<FormState> _formekey = GlobalKey<FormState>();

  String _infoText = "Informe os dados!";

  void _calculate() {
    setState(() {
      double gasoline = double.parse(_gasolineController.text);
      double alcohol = double.parse(_alcoholController.text);
      double result = (gasoline - alcohol);
      if (result < 0) {
        _infoText =
            "Álcool custa R\$${(result * -1).toStringAsFixed(2)} a mais do que a gasolina.";
      } else if (result > 0) {
        _infoText =
            "Gasolina custa R\$${(result).toStringAsFixed(2)} a mais do que o álcool.";
      } else {
        _infoText = "Ambos combustíveis tem o mesmo preço!!!";
      }
    });
  }

  void _resetFild() {
    _gasolineController.text = "";
    _alcoholController.text = "";
    setState(() {
      _infoText = "Informe os dados!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _resetFild,
            icon: Icon(
              Icons.replay_outlined,
              color: Theme.of(context).copyWith().secondaryHeaderColor,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "Gasolina vs Alcool",
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formeKey,
          child: Column(
            children: [
              // Padding(
              //   // Adapta a tela de preenchimento do model p/ que fique sempre visível.
              //   padding: EdgeInsets.only(
              //       bottom: MediaQuery.of(context).viewInsets.top),
              // ),
              const SizedBox(height: 12),
              SizedBox(
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: const Color.fromARGB(255, 71, 190, 75),
                  child: Image.asset(
                    AppImages.fuel,
                    scale: 3.5,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildIconShell(AppColors.blue),
                    buildIconShell(AppColors.yellow),
                    buildIconShell(AppColors.red)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.top,
                  top: 15,
                ),
              ),
              BuildFuelTextField(
                controller: _gasolineController,
                textInputAction: TextInputAction.next,
                label: "Preço gasolina",
                keyboardType: TextInputType.number,
                validator: 'Informe o preço da gasolina',
              ),
              BuildFuelTextField(
                controller: _alcoholController,
                textInputAction: TextInputAction.done,
                label: "Preço Álcool",
                keyboardType: TextInputType.number,
                validator: 'Informe o preço do Álcool',
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // primary: Colors.cyan[300],
                        // //onSurface: Colors.cyan[300],
                        // elevation: 8,
                        // shadowColor: Colors.cyan[300],
                        ),
                    onPressed: () {
                      if (_formeKey.currentState?.validate() ?? false) {
                        _calculate();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            Theme.of(context).copyWith().secondaryHeaderColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  text: "Resultado:",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: " $_infoText",
                      style: const TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

buildIconShell(dynamic color) {
  return SizedBox(
    child: CircleAvatar(
      radius: 30.0,
      backgroundColor: color,
      child: Image.asset(
        AppImages.fuel,
        scale: 11,
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}

// buildFuelTextField(
//   String label,
//   dynamic control,
//   String answers,
// ) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: TextFormField(
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//           labelStyle: TextStyle(color: Colors.grey),
//         ),
//         textAlign: TextAlign.left,
//         style: TextStyle(
//           color: Colors.grey[600],
//           fontSize: 16,
//         ),
//         controller: control,
//         validator: (value) {
//           if (value == null) {
//             return answers;
//           }
//         }),
//   );
// }
