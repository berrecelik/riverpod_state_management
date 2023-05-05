import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Counter",
            style: GoogleFonts.philosopher(fontSize: 27, color: Colors.white)),
      ),
      body: Center(
        child:
            Text('Value: $value', style: GoogleFonts.philosopher(fontSize: 40)),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: "Button 1",
                backgroundColor: Colors.black,
                onPressed: () =>
                    ref.read(counterStateProvider.notifier).state++,
                child: const Icon(Icons.add)),
            Expanded(child: Container()),
            FloatingActionButton(
              heroTag: "Button 2",
              backgroundColor: Colors.black,
              onPressed: () => ref.read(counterStateProvider.notifier).state--,
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
