import "package:flutter/material.dart";
import 'package:piquirigg/core/shared/utils/assets_postions.dart';
import 'package:piquirigg/core/shared/utils/enums.dart';

class TogglePositionWidget extends StatefulWidget {
  Function selectedPosition;
  TogglePositionWidget({Key? key, required this.selectedPosition})
      : super(key: key);

  @override
  State<TogglePositionWidget> createState() => _TogglePositionWidgetState();
}

class _TogglePositionWidgetState extends State<TogglePositionWidget> {
  // bool _selectedPosition =
  List<bool> _positions = [false, false, false, false, false, false];

  String _getNameFromPosition(int index) {
    switch (index) {
      case 0:
        return Position.preencher;
      case 1:
        return Position.top;
      case 2:
        return Position.jungle;
      case 3:
        return Position.mid;
      case 4:
        return Position.adc;
      case 5:
        return Position.sup;
      default:
        return Position.preencher;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF31313C), borderRadius: BorderRadius.circular(12)),
      height: 50,
      // width: double.maxFinite,
      child: ToggleButtons(
        fillColor: Color(0xFF00C0A4),
        borderColor: Colors.grey,
        selectedBorderColor: Colors.grey,
        borderRadius: BorderRadius.circular(12),
        isSelected: _positions,
        onPressed: (index) {
          setState(() {
            _positions.fillRange(0, 6, false);
            _positions[index] = true;
            widget.selectedPosition(_getNameFromPosition(index));
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(PositionsModel.preencher, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(PositionsModel.top, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(PositionsModel.jungle, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(PositionsModel.mid, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(PositionsModel.adc, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(PositionsModel.sup, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
