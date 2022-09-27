import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bootcamp/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final textController = TextEditingController();

  final ValueController valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // valor
            GetBuilder<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return Text('Valor definido: ${ctrl.definedValue}');
              },
            ),
            // campo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: TextField(controller: textController),
            ),
            //botao
            GetBuilder<ValueController>(
                init: valueController,
                builder: (ctrl) {
                  return ctrl.isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            valueController.setValue(textController.text);
                          },
                          child: const Text('Confirmar'));
                }),
          ],
        ),
      ),
    );
  }
}
