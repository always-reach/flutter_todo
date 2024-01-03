import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo/constant/error_message.dart';
import 'package:todo/entity/task.dart';
import 'package:todo/repository/task_imp.dart';

class TaskCreateForm extends StatefulWidget {
  const TaskCreateForm({required Key key}) : super(key: key);

  @override
  _TaskCreateFormState createState() => _TaskCreateFormState();
}

class _TaskCreateFormState extends State<TaskCreateForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Mission"),
        ),
        body: FormBuilder(
          key: _formKey,
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: FormBuilderTextField(
                name: "title",
                decoration: const InputDecoration(labelText: "タイトル"),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: ErrorMessages.required),
                  FormBuilderValidators.maxLength(255,
                      errorText: ErrorMessages.maxLength(255)),
                ]),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: FormBuilderTextField(
                    name: "description",
                    decoration: const InputDecoration(labelText: "説明"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.maxLength(255,
                          errorText: ErrorMessages.maxLength(255)),
                    ]))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: FormBuilderTextField(
                  name: "point",
                  decoration: const InputDecoration(labelText: "ポイント"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: ErrorMessages.required),
                    FormBuilderValidators.max(100,
                        errorText: ErrorMessages.max(100)),
                    FormBuilderValidators.min(1,
                        errorText: ErrorMessages.min(1)),
                  ]),
                  keyboardType: TextInputType.number,
                )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FormBuilderDropdown(
                name: "taskType",
                decoration: const InputDecoration(labelText: "タスクタイプ"),
                initialValue: 1,
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text("デイリー"),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text("ウィークリー"),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text("マンスリー"),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () async {
                var currentState = _formKey.currentState;
                if (currentState != null && currentState.saveAndValidate()) {
                  var formValue = Map<String, dynamic>.from(currentState.value);
                  formValue["isComplete"] = 0;
                  formValue["atComplete"] = null;
                  formValue["point"] = formValue["point"] != null
                      ? int.tryParse(formValue["point"]) ?? 0
                      : 0;
                  var task = Task.fromMap(formValue);
                  await TaskRepositry().insertTask(task);
                  Navigator.pop(context);
                } else {
                  debugPrint(_formKey.currentState?.value.toString());
                  debugPrint('validation failed');
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.blue)),
              child: const Text("登録"),
            )
          ]),
        ));
  }
}
