import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text("Custom buttons"),
          ),
        ),
        body: Container(
          // height: 80.0,
          color: Colors.white,
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: "Submit", icon: Icons.check),
              SizedBox(height: 10.0),
              CustomButton(
                label: "Time",
                icon: Icons.timer,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.secondary,
              ),
              SizedBox(height: 10.0),
              CustomButton(
                label: "Account",
                icon: Icons.account_tree_sharp,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  Color _getButtonColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = _getButtonColor();

    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled ? null : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.white70,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildButtonContent(),
      ),
    );
  }

  List<Widget> _buildButtonContent() {
    final iconWidget = Icon(icon);
    const textWidget = SizedBox(width: 8);
    final labelWidget = Text(label);

    if (iconPosition == IconPosition.left) {
      return [iconWidget, textWidget, labelWidget];
    } else {
      return [labelWidget, textWidget, iconWidget];
    }
  }
}
