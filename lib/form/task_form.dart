import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo/constant/error_message.dart';
import 'package:todo/entity/task.dart';

class TaskForm extends StatelessWidget {
  final Future<void> Function(Task task) onSubmit;
  final Map<String, dynamic>? initialValue;
  const TaskForm({Key? key, required this.onSubmit, this.initialValue})
      : super(key: key);

  void handleSubmit(Map<String, dynamic> formValue) async {
    formValue["isComplete"] = 0;
    formValue["atComplete"] = null;
    var task = Task.fromMap(formValue);
    await onSubmit(task);
  }

  Map<String, dynamic> formValue() {
    if (initialValue == null) return {};
    initialValue!["point"] = initialValue!["point"].toString();

    return initialValue!;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return FormBuilder(
        key: formKey,
        initialValue: formValue(),
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
                valueTransformer: (value) =>
                    value == null ? null : int.tryParse(value.toString()) ?? 0,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: ErrorMessages.required),
                  FormBuilderValidators.numeric(
                      errorText: ErrorMessages.number),
                  FormBuilderValidators.max(100,
                      errorText: ErrorMessages.max(100)),
                  FormBuilderValidators.min(1, errorText: ErrorMessages.min(1)),
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
              var currentState = formKey.currentState;
              if (currentState != null && currentState.saveAndValidate()) {
                var formValue = Map<String, dynamic>.from(currentState.value);
                handleSubmit(formValue);
              } else {
                debugPrint(formKey.currentState?.value.toString());
                debugPrint('validation failed');
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.blue)),
            child: initialValue == null ? const Text("登録") : const Text("更新"),
          )
        ]));
  }
}
