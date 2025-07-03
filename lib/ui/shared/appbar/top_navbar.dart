import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imba/ui/shared/appbar/nav_tab.dart';
import 'package:imba/ui/shared/appbar/search_bar.dart';

class TopNavbar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  final int selectedTabIndex;
  final Function(int) onTabChanged;

  const TopNavbar({
    super.key,
    required this.selectedTabIndex,
    required this.onTabChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  ConsumerState<TopNavbar> createState() => _TopNavbarState();
}

class _TopNavbarState extends ConsumerState<TopNavbar> {
  void _onTabSelected(int index) {
    widget.onTabChanged(index);
  }

  double _getAppBarHeight(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    // Estimate: logo/menu row (48) + search bar (56) + padding (16)
    if (isMobile) {
      return 100.0; // Reduced default mobile height
    }
    return isMobile ? 100.0 : 160.0; // Reduced default mobile height
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        backgroundColor: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Material(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: SafeArea(child: NavSearchBar()),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = _getAppBarHeight(context);

    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: appBarHeight,
      flexibleSpace: Padding(
        padding: EdgeInsets.only(
          top: statusBarHeight + (isMobile ? 8 : 16),
          left: isMobile ? 16 : 24,
          right: isMobile ? 16 : 24,
          bottom: isMobile ? 8 : 12,
        ),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    // Left section
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFF1F1F1),
                          child: Builder(
                            builder: (context) {
                              return IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        if (isMobile)
                          CircleAvatar(
                            backgroundColor: Color(0xFFF1F1F1),
                            child: IconButton(
                              icon: const Icon(
                                Icons.search,
                                size: 20,
                                color: Colors.black54,
                              ),
                              onPressed: () => _showSearchDialog(context),
                            ),
                          ),
                      ],
                    ),

                    const Spacer(),

                    if (!isMobile)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => _onTabSelected(0),
                            child: NavTab(
                              icon: Image.asset(
                                'assets/icon/house.png',
                                height: 20,
                              ),
                              label: "Homes",
                              isActive: widget.selectedTabIndex == 0,
                            ),
                          ),
                          const SizedBox(width: 24),
                          GestureDetector(
                            onTap: () => _onTabSelected(1),
                            child: NavTab(
                              icon: Image.asset(
                                'assets/icon/agent.png',
                                height: 20,
                              ),
                              label: "Agencies",
                              isActive: widget.selectedTabIndex == 1,
                            ),
                          ),
                        ],
                      ),

                    const Spacer(),

                    // Right section - Logo
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/logo.png', height: 32),
                        const SizedBox(width: 8),
                        const Text(
                          "imba",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 16),
            if (!isMobile) ...[
              const SizedBox(height: 16),
              const NavSearchBar(),
            ],
          ],
        ),
      ),
    );
  }
}
