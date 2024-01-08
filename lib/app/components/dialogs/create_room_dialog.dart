import 'package:canary_app/app/components/toast.dart';
import 'package:canary_app/app/provider/providers/room_provider.dart';
import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/widgets/my_button.dart';
import 'package:canary_app/app/widgets/my_text_form_field.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateRoomDialog extends StatefulWidget {
  const CreateRoomDialog({super.key});

  @override
  State<CreateRoomDialog> createState() => _CreateRoomDialogState();
}

class _CreateRoomDialogState extends State<CreateRoomDialog> {
  final TextEditingController _roomName = TextEditingController();

  void _createRoom() async {
    final state = await context
        .read<RoomProvider>()
        .createRoom(Room(name: _roomName.text));
    if (state is DoneState) {
      MySnackBar.showMyToast(text: "تم انشاء الرووم بنجاح");
      mounted ? Navigator.pop(context) : null;
    } else if (state is ErrorState) {
      MySnackBar.showMyToast(text: state.failure.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("انشاء رووم"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTextFormField(
            labelText: "أدخل اسم الرووم",
            controller: _roomName,
            enabled: !context.watch<RoomProvider>().isLoading,
          ),
          Row(
            children: [
              MyButton(
                text: "انشاء",
                onPressed: _createRoom,
              ),
              MyButton(
                text: "الغاء",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
