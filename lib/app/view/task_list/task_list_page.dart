import 'package:flutter/material.dart';
import 'package:sem9_lab_ver2/app/model/task.dart';
import 'package:sem9_lab_ver2/app/view/components/h1.dart';
import 'package:sem9_lab_ver2/app/view/components/shape.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final taskLista = <Task>[
    Task("Tarea Agregada"),
    Task("Nuevas Tarea de Hoy"),
    Task("Revisar Trabajos"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Center(child: Text('Atrás')),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const Row(children: [Shape()]),
                Column(
                  children: [
                    Image.asset(
                      'assets/tasks-list-image.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 16),
                    const H1('Completa tus tareas', Colors.white),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: H1('Tareas', Colors.black),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                itemBuilder: (_, index) => _TaskItem(
                  taskLista[index],
                  toque: () {
                    setState(() {
                      taskLista[index].done = !taskLista[index].done;
                    });
                  },
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: taskLista.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewTaskModal(context);
        },
        child: const Icon(Icons.add, size: 50),
      ),
    );
  }

  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _NewTaskModal(
          onTaskCreate: (Task task) {
            setState(() {
              taskLista.add(task);
            });
          },
        );
      },
    );
  }
}

class _NewTaskModal extends StatelessWidget {
  _NewTaskModal({super.key, required this.onTaskCreate});

  final _controller = TextEditingController();
  final void Function(Task task) onTaskCreate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 23),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const H1("Nueva Tarea", Colors.amber),
          const SizedBox(height: 26),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 26),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                final task = Task(_controller.text);
                onTaskCreate(task);
                Navigator.of(context).pop();
              }
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {super.key, this.toque});

  final Task task;
  final VoidCallback? toque;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toque,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(
                task.done
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(task.title),
            ],
          ),
        ),
      ),
    );
  }
}
