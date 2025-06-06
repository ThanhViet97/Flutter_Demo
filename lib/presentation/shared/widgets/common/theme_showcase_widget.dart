import 'package:flutter/material.dart';
import '../../../../config/themes/index.dart';

/// Widget để showcase dark theme và các components
/// Sử dụng để demo và test theme
class ThemeShowcaseWidget extends StatefulWidget {
  const ThemeShowcaseWidget({super.key});

  @override
  State<ThemeShowcaseWidget> createState() => _ThemeShowcaseWidgetState();
}

class _ThemeShowcaseWidgetState extends State<ThemeShowcaseWidget> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 0.5;
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final businessCardTheme = Theme.of(context).extension<BusinessCardTheme>()!;
    final statusTheme = Theme.of(context).extension<StatusIndicatorTheme>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Theme Showcase'),
        actions: [
          IconButton(
            icon: const Icon(Icons.palette),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================== TYPOGRAPHY SECTION ====================
            _buildSection(
              'Typography',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Display Large', style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: AppDimensions.spacingS),
                  Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge),
                  const SizedBox(height: AppDimensions.spacingS),
                  Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: AppDimensions.spacingS),
                  Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: AppDimensions.spacingS),
                  Text('Label Large', style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            ),

            // ==================== BUSINESS CARDS SECTION ====================
            _buildSection(
              'Business Cards',
              Column(
                children: [
                  _buildBusinessCard(
                    businessCardTheme,
                    title: 'John Doe',
                    subtitle: 'Senior Developer',
                    status: 'Active',
                    isActive: true,
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  _buildBusinessCard(
                    businessCardTheme,
                    title: 'Jane Smith',
                    subtitle: 'Product Manager',
                    status: 'Inactive',
                    isActive: false,
                  ),
                ],
              ),
            ),

            // ==================== BUTTONS SECTION ====================
            _buildSection(
              'Buttons',
              Wrap(
                spacing: AppDimensions.spacingM,
                runSpacing: AppDimensions.spacingS,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Elevated'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Outlined'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Text'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('With Icon'),
                  ),
                ],
              ),
            ),

            // ==================== STATUS INDICATORS SECTION ====================
            _buildSection(
              'Status Indicators',
              Wrap(
                spacing: AppDimensions.spacingM,
                runSpacing: AppDimensions.spacingS,
                children: [
                  _buildStatusChip('Active', statusTheme.activeColor),
                  _buildStatusChip('Inactive', statusTheme.inactiveColor),
                  _buildStatusChip('Pending', statusTheme.pendingColor),
                  _buildStatusChip('Success', statusTheme.successColor),
                  _buildStatusChip('Warning', statusTheme.warningColor),
                  _buildStatusChip('Error', statusTheme.errorColor),
                ],
              ),
            ),

            // ==================== FORM CONTROLS SECTION ====================
            _buildSection(
              'Form Controls',
              Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Label',
                      hintText: 'Hint text',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Error Field',
                      errorText: 'This field has an error',
                      prefixIcon: Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  Row(
                    children: [
                      Checkbox(
                        value: _checkboxValue,
                        onChanged: (value) {
                          setState(() {
                            _checkboxValue = value ?? false;
                          });
                        },
                      ),
                      const Text('Checkbox'),
                      const Spacer(),
                      Switch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                      const Text('Switch'),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  Slider(
                    value: _sliderValue,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // ==================== CARDS SECTION ====================
            _buildSection(
              'Cards',
              Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimensions.cardPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card Title',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: AppDimensions.spacingS),
                          Text(
                            'This is a card with some content. Cards are good for grouping related information.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppDimensions.spacingM),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('Action 1'),
                              ),
                              const SizedBox(width: AppDimensions.spacingS),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Action 2'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ==================== LIST TILES SECTION ====================
            _buildSection(
              'List Tiles',
              Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.businessAccent,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: const Text('List Item 1'),
                    subtitle: const Text('This is a subtitle'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    subtitle: const Text('App preferences'),
                    trailing: Switch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('Information'),
                    subtitle: const Text('Learn more about the app'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // ==================== TABS SECTION ====================
            _buildSection(
              'Tabs',
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.home), text: 'Home'),
                        Tab(icon: Icon(Icons.business), text: 'Business'),
                        Tab(icon: Icon(Icons.settings), text: 'Settings'),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: TabBarView(
                        children: [
                          const Center(child: Text('Home Content')),
                          const Center(child: Text('Business Content')),
                          const Center(child: Text('Settings Content')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.spacingM),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        content,
        const SizedBox(height: AppDimensions.spacingXL),
      ],
    );
  }

  Widget _buildBusinessCard(
    BusinessCardTheme theme, {
    required String title,
    required String subtitle,
    required String status,
    required bool isActive,
  }) {
    return Container(
      width: double.infinity,
      padding: theme.padding,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(theme.borderRadius),
        border: Border.all(color: theme.borderColor),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: theme.elevation * 2,
            offset: Offset(0, theme.elevation),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: theme.iconColor,
                child: Icon(
                  Icons.person,
                  color: theme.backgroundColor,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.businessCardTitle.copyWith(
                        color: theme.titleColor,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.businessCardSubtitle.copyWith(
                        color: theme.subtitleColor,
                      ),
                    ),
                  ],
                ),
              ),
              _buildStatusChip(
                status,
                isActive ? theme.statusActiveColor : theme.statusInactiveColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingS,
        vertical: AppDimensions.spacingXS,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: AppTextStyles.businessStatus.copyWith(color: color),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppDimensions.sectionPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Bottom Sheet',
              style: AppTextStyles.headlineSmall,
            ),
            const SizedBox(height: AppDimensions.spacingM),
            const Text(
              'This is a modal bottom sheet with dark theme styling.',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppDimensions.spacingL),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 