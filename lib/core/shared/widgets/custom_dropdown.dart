import '../../../core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> options;
  final ValueChanged<T>? onChanged;
  final String Function(T) displayString;
  final String? hint;
  final String? label;
  final T? initialValue;
  final Color? borderColor;

  const CustomDropdown({
    super.key,
    required this.options,
    required this.displayString,
    this.onChanged,
    this.hint,
    this.label,
    this.initialValue,
    this.borderColor,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? _selectedOption;
  bool _isOpen = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selectedOption = widget.initialValue;
    }
    if (widget.onChanged != null) {
      if (_selectedOption != null) {
        widget.onChanged!(_selectedOption as T);
      }
    }
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _selectOption(T option) {
    setState(() {
      _selectedOption = option;
      _isOpen = false;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(option);
    }
    _removeOverlay();
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;

    return OverlayEntry(
      builder: (BuildContext context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: widget.options.length,
                itemBuilder: (BuildContext context, int index) {
                  final T option = widget.options[index];
                  final bool isSelected = option == _selectedOption;
                  return InkWell(
                    onTap: () => _selectOption(option),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: Text(
                        widget.displayString(option),
                        style: context.txtTheme.bodyMedium?.copyWith(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: context.screenWidth,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            GestureDetector(
              onTap: _toggleDropdown,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 14.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: widget.borderColor ?? AppColors.primary,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _selectedOption != null
                          ? widget.displayString(_selectedOption as T)
                          : widget.hint ?? "Select an option",
                      style: context.txtTheme.bodySmall?.copyWith(
                        color: _selectedOption != null
                            ? Colors.black
                            : AppColors.grey,
                      ),
                    ),
                    if (_isOpen)
                      const Icon(
                        Icons.keyboard_arrow_up_sharp,
                        color: AppColors.primary,
                      )
                    else
                      const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: AppColors.primary,
                      ),
                  ],
                ),
              ),
            ),

            if (widget.label != null)
              Positioned(
                top: -8,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.white, // white to cover the border
                  child: Text(
                    widget.label!,
                    style: context.txtTheme.bodySmall?.copyWith(
                      color: AppColors.primary,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
