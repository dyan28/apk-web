import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students/components/app_text_style.dart';

class TopGameCircle extends StatelessWidget {
  const TopGameCircle({super.key, this.topNumber, this.imageUrl});
  final String? topNumber;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 100,
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              border: Border.all(width: 3, color: Colors.red),
            ),
            child: Image.network(imageUrl ?? ''),
          ),
          Positioned(
            bottom: 4,
            left: 35,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(90),
                border: Border.all(width: 1, color: Colors.red),
              ),
              child: Center(
                child: Transform.translate(
                  offset: Offset(0, -4),
                  child: Text(
                    topNumber ?? '',
                    style: AppTextStyle.medium
                        .copyWith(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientStreak extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Tạo gradient màu tím nhạt dần
    final gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.purple.shade200, // Màu tím nhạt ở bên trái
        Colors.purple, // Màu tím đậm hơn ở giữa
      ],
      stops: const [
        0.0,
        0.9
      ], // Điều chỉnh điểm dừng để màu nhạt hơn ở phần lớn chiều dài
    );

    // Tạo Paint cho gradient
    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width - 20,
          size.height)) // Trừ 20 để chừa chỗ cho hình chữ nhật
      ..strokeWidth = size.height / 2 // Độ dày của vệt màu
      ..strokeCap = StrokeCap.round; // Bo tròn đầu vệt màu

    // Vẽ vệt màu
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width - 20,
          size.height / 2), // Trừ 20 để chừa chỗ cho hình chữ nhật
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
