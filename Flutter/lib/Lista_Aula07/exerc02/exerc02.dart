import 'package:flutter/material.dart';
import 'package:flutter_ex1/Lista_Aula07/exerc02/Contador.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Contador(),
      child: const MaterialApp(home: TelaPrincipal()),
    ),
  );
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Consumer<Contador>(
          builder: (context, contadorCache, _) {
            return Column(
              children: [
                Text('Valor Atual:', style: TextStyle(fontSize: 24)),

                Text(
                  '${contadorCache.valor}',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 40),

                ElevatedButton(
                  onPressed: contadorCache.incrementarValor,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: Text(
                    "Incrementar",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),

                ElevatedButton(
                  onPressed: contadorCache.decrementarValor,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: Text(
                    "Decrementar",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            );
          },
        ),
        /*

        */
      ),
    );
  }
}
