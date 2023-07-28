import 'package:flutter/material.dart';

class StatusLoading extends StatelessWidget {
  final String? text;

  const StatusLoading({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(Color(0xFF999999)),
          ),
          const SizedBox(height: 10),
          Text(
            text ?? "加载中...",
            style: const TextStyle(
              color: Color(0xFF999999),
              fontSize: 28,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

class StatusEmpty extends StatelessWidget {
  final String? text;

  const StatusEmpty({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text ?? "暂无数据",
        style: const TextStyle(
          color: Color(0xFF999999),
          fontSize: 28,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

class StatusError extends StatelessWidget {
  final GestureTapCallback? onRetry;

  const StatusError({Key? key, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRetry,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Σ(oﾟдﾟoﾉ)",
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 28,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "加载失败~",
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 28,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
