import 'package:flutter/material.dart';
import 'package:sem9_lab_ver2/app/view/components/h1.dart';
import 'package:sem9_lab_ver2/app/view/components/shape.dart';
import 'package:sem9_lab_ver2/app/view/task_list/task_list_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Shape(),
            ],
          ),
          const SizedBox(height: 79),
          Image.asset("assets/onboarding-image.png", width: 180, height: 168,),
          const SizedBox(height: 99),
          const H1("Lista de tareas", Colors.amber),
          const SizedBox(height: 21),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 32)),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const TaskListPage();
                })
              );
            },
            child: const Text("Laaa mejor forma para que no se t eolvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad",
          textAlign: TextAlign.center,
          ),
          )
        ],
      ),
    );
  }
}
