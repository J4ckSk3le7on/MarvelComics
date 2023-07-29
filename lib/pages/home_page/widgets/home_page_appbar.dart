import 'package:marvel_comics/core/enums/enums.dart';
import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget{
  final void Function(HomeViewType viewType) changeView;
  final HomeViewType currentViewType;
  final TextEditingController textController;
  final void Function(String text) search;
  final void Function(bool isSearching) setSearch;
  final bool isSearching;

  const HomePageAppBar({
    Key? key,
    required this.changeView,
    required this.currentViewType,
    required this.textController,
    required this.search,
    required this.setSearch,
    required this.isSearching
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isSearching == false ? const Text("Comic App") : TextField(
        onChanged: (value) {
          search(value);
          setSearch(value.isNotEmpty ? true : false);
        },
        controller: textController,
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => changeView(HomeViewType.list),
          icon: const Icon(Icons.list),
          color: currentViewType == HomeViewType.list ? Colors.blue : Colors.grey,
        ),
        IconButton(
          onPressed: () => changeView(HomeViewType.grid),
          icon: const Icon(Icons.grid_3x3),
          color: currentViewType == HomeViewType.grid ? Colors.blue : Colors.grey,
        )
      ],
    );
  }

}
