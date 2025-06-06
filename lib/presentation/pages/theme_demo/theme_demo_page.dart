import 'package:flutter/material.dart';
import '../../../config/themes/index.dart';
import '../../shared/widgets/common/theme_showcase_widget.dart';

/// Page để demo dark theme system
/// Showcase tất cả components đã được themed
class ThemeDemoPage extends StatefulWidget {
  const ThemeDemoPage({super.key});

  @override
  State<ThemeDemoPage> createState() => _ThemeDemoPageState();
}

class _ThemeDemoPageState extends State<ThemeDemoPage> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Theme Demo'),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.palette), text: 'Colors'),
            Tab(icon: Icon(Icons.text_fields), text: 'Typography'), 
            Tab(icon: Icon(Icons.widgets), text: 'Components'),
            Tab(icon: Icon(Icons.business), text: 'Business'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showThemeInfo(context),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildColorsTab(),
          _buildTypographyTab(),
          _buildComponentsTab(),
          _buildBusinessTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ThemeShowcaseWidget(),
            ),
          );
        },
        icon: const Icon(Icons.preview),
        label: const Text('Full Showcase'),
      ),
    );
  }

  Widget _buildColorsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Primary Colors'),
          _buildColorGrid([
            _ColorItem('Primary', AppColors.primary),
            _ColorItem('Primary Variant', AppColors.primaryVariant),
            _ColorItem('Secondary', AppColors.secondary),
            _ColorItem('Business Accent', AppColors.businessAccent),
          ]),
          
          const SizedBox(height: AppDimensions.spacingXL),
          _buildSectionHeader('Dark Theme Colors'),
          _buildColorGrid([
            _ColorItem('Background', AppColors.backgroundDark),
            _ColorItem('Surface', AppColors.surfaceDark),
            _ColorItem('Card', AppColors.cardDark),
            _ColorItem('Surface Variant', AppColors.surfaceVariantDark),
          ]),

          const SizedBox(height: AppDimensions.spacingXL),
          _buildSectionHeader('Status Colors'),
          _buildColorGrid([
            _ColorItem('Success', AppColors.success),
            _ColorItem('Warning', AppColors.warning),
            _ColorItem('Error', AppColors.error),
            _ColorItem('Active', AppColors.statusActive),
          ]),
        ],
      ),
    );
  }

  Widget _buildTypographyTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Display Styles'),
          _buildTypographyExample('Display Large', AppTextStyles.displayLarge),
          _buildTypographyExample('Display Medium', AppTextStyles.displayMedium),
          _buildTypographyExample('Display Small', AppTextStyles.displaySmall),
          
          const SizedBox(height: AppDimensions.spacingXL),
          _buildSectionHeader('Headline Styles'),
          _buildTypographyExample('Headline Large', AppTextStyles.headlineLarge),
          _buildTypographyExample('Headline Medium', AppTextStyles.headlineMedium),
          _buildTypographyExample('Headline Small', AppTextStyles.headlineSmall),
          
          const SizedBox(height: AppDimensions.spacingXL),
          _buildSectionHeader('Body & Label Styles'),
          _buildTypographyExample('Body Large', AppTextStyles.bodyLarge),
          _buildTypographyExample('Body Medium', AppTextStyles.bodyMedium),
          _buildTypographyExample('Label Large', AppTextStyles.labelLarge),
          _buildTypographyExample('Label Medium', AppTextStyles.labelMedium),
        ],
      ),
    );
  }

  Widget _buildComponentsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Buttons'),
          Wrap(
            spacing: AppDimensions.spacingM,
            runSpacing: AppDimensions.spacingS,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
              OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              TextButton(onPressed: () {}, child: const Text('Text')),
            ],
          ),

          const SizedBox(height: AppDimensions.spacingXL),
          _buildSectionHeader('Cards'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.cardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card Title', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: AppDimensions.spacingS),
                  Text(
                    'This is a card with dark theme styling. Notice the colors, shadows, and typography.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppDimensions.spacingXL),
          _buildSectionHeader('Form Elements'),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Label',
              hintText: 'Hint text',
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessTab() {
    final businessCardTheme = Theme.of(context).extension<BusinessCardTheme>()!;
    final statusTheme = Theme.of(context).extension<StatusIndicatorTheme>()!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Business Cards'),
          _buildBusinessCard(
            businessCardTheme,
            title: 'John Doe',
            subtitle: 'Senior Flutter Developer',
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

          const SizedBox(height: AppDimensions.spacingXL),
          _buildSectionHeader('Status Indicators'),
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
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spacingM),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildColorGrid(List<_ColorItem> colors) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimensions.spacingM,
        mainAxisSpacing: AppDimensions.spacingM,
        childAspectRatio: 3,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final colorItem = colors[index];
        return Container(
          decoration: BoxDecoration(
            color: colorItem.color,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(
              color: AppColors.outline.withOpacity(0.2),
            ),
          ),
          child: Center(
            child: Text(
              colorItem.name,
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.getContrastingTextColor(colorItem.color),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTypographyExample(String name, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.businessAccent,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXS),
          Text('The quick brown fox jumps over the lazy dog', style: style),
        ],
      ),
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
      child: Row(
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

  void _showThemeInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Dark Theme Info'),
        content: const Text(
          'This dark theme is built with Material Design 3 principles '
          'and includes custom business components. It features:\n\n'
          '• Professional color palette\n'
          '• Complete typography scale\n'
          '• Business card themes\n'
          '• Status indicators\n'
          '• Form styling\n'
          '• Responsive design',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class _ColorItem {
  final String name;
  final Color color;

  const _ColorItem(this.name, this.color);
} 