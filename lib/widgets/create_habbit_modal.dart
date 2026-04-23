import 'package:canvas_practice/logic/models/habit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCreateHabitModal(BuildContext context, void Function(Habit) onSave) {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final freqController = TextEditingController();
  final addictionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F7),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Create Habit",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1C1C1E),
                ),
              ),
              const SizedBox(height: 20),
              _buildValidatedField(
                controller: nameController,
                placeholder: "Habit Name",
                validator: (v) {
                  if (v == null || v.trim().isEmpty)
                    return "Name can't be empty bestie";
                  if (v.trim().length < 3) return "At least 3 chars, come on";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _buildValidatedField(
                controller: descController,
                placeholder: "Description",
                validator: (v) {
                  if (v == null || v.trim().isEmpty)
                    return "Add a lil description";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _buildValidatedField(
                controller: freqController,
                placeholder: "Frequency (times/day)",
                type: TextInputType.number,
                validator: (v) {
                  final n = int.tryParse(v ?? '');
                  if (n == null) return "Numbers only no cap";
                  if (n < 1 || n > 99) return "Keep it between 1–99";
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _buildValidatedField(
                controller: addictionController,
                placeholder: "Addiction Level (0.0 – 1.0)",
                type: const TextInputType.numberWithOptions(decimal: true),
                validator: (v) {
                  final n = double.tryParse(v ?? '');
                  if (n == null) return "Decimal number only fam";
                  if (n < 0.0 || n > 1.0) return "Must be between 0.0 and 1.0";
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      color: const Color(0xFFE5E5EA),
                      borderRadius: BorderRadius.circular(12),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color(0xFF8E8E93),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      color: const Color(0xFF7B61FF),
                      borderRadius: BorderRadius.circular(12),
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;

                        final habit = Habit(
                          name: nameController.text.trim(),
                          description: descController.text.trim(),
                          frequency: int.parse(freqController.text.trim()),
                          addictionLevel: double.parse(
                            addictionController.text.trim(),
                          ),
                          isFinished: false,
                        );

                        onSave(habit);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildValidatedField({
  required TextEditingController controller,
  required String placeholder,
  TextInputType type = TextInputType.text,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validator,
    decoration: InputDecoration(
      hintText: placeholder,
      hintStyle: const TextStyle(color: Color(0xFFAEAEB2)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF7B61FF), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFFF453A), width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFFF453A), width: 1.5),
      ),
      errorStyle: const TextStyle(color: Color(0xFFFF453A), fontSize: 12),
    ),
  );
}
