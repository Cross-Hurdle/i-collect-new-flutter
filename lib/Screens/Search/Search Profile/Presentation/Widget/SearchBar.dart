import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

class SearchBar extends ConsumerStatefulWidget {
  final List name;
  const SearchBar({Key? key,required this.name}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.name.length,
          itemBuilder: (context,index){
           return Container(
             child: Text(widget.name[index]),
           );
        }),
      ],
    );
  }
}