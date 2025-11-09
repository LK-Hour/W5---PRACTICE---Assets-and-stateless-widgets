# W5 Flutter Practice - Assets and Stateless Widgets

## 📚 Learning Resources

### Required Reading/Viewing:
- [ ] Review Flutter Tutorial for Beginners videos (60c82bddaba3e and 60c82bddaba15)
- [ ] Watch Flutter Layout basics video (https://www.youtube.com/watch?v=GPoRjSjd1cI)
- [ ] Review Card class documentation (https://api.flutter.dev/flutter/material/Card-class.html)
- [ ] Review Flutter Tutorial section 60c82bddaba0
- [ ] Review Image class documentation (https://api.flutter.dev/flutter/widgets/Image-class.html)

---

## 🎯 Exercise 4: Weather Forecast App (BONUS)

### Goal: Build a beautiful weather forecast app with gradient cards

This advanced exercise demonstrates gradient backgrounds, complex layouts, and real-world design patterns.

### Part 1: Project Setup
- [ ] Ensure DevicePreview is configured
- [ ] Review the reference image carefully

### Part 2: Create WeatherCard Widget
- [ ] Create `WeatherCard` stateless widget class
- [ ] Add parameters: `city`, `minTemp`, `maxTemp`, `currentTemp`, `icon`, `startColor`, `endColor`
- [ ] Implement gradient background using LinearGradient
- [ ] Create circular icon container with semi-transparent white background
- [ ] Add city name and min/max temps on left side
- [ ] Display large current temperature on right side

**Design Specifications:**
- Card padding: 20px all sides
- Border radius: 20px
- Icon container: Circle with white 30% opacity, padding 12px
- Icon size: 32px white
- City name: 20px bold white text
- Min/Max temps: 14px white text (90% opacity)
- Current temp: 28px bold white text
- Spacing between cards: 15px
- Overall padding: 20px

**Card Colors (Gradient left to right):**
1. Phnom Penh: Purple gradient (#DA4EF2 → #B580F0)
2. Paris: Teal/Green gradient (#5FE3D0 → #7BE495)
3. Rome: Pink/Red gradient (#FF6B9D → #FF8BA7)
4. Toulouse: Orange gradient (#FFC371 → #FFD89B)

### Part 3: Main App Structure
- [ ] Set Scaffold backgroundColor to grey[100]
- [ ] Create blue AppBar (Colors.blue[300])
- [ ] Set AppBar title to "Weather Forecast" with white text
- [ ] Remove AppBar elevation (elevation: 0)

### Part 4: Body Layout
- [ ] Use Padding (20px all sides)
- [ ] Create Column with crossAxisAlignment.stretch
- [ ] Add four WeatherCard widgets
- [ ] Add SizedBox(height: 15) between each card

**Weather Cards Data:**
1. **Phnom Penh**: Min 12.0°C, Max 30.0°C, Current 12.2°C, Icon: wb_cloudy_outlined
2. **Paris**: Min 10.0°C, Max 35.0°C, Current 22.2°C, Icon: wb_cloudy_outlined
3. **Rome**: Min 10.0°C, Max 40.0°C, Current 45.2°C, Icon: wb_sunny_outlined
4. **Toulouse**: Min 10.0°C, Max 40.0°C, Current 45.2°C, Icon: wb_cloudy_outlined

### Part 5: Testing
- [ ] Run app and verify all gradient colors match the image
- [ ] Check icon containers have circular semi-transparent backgrounds
- [ ] Verify text sizes and spacing match exactly
- [ ] Test on different screen sizes with DevicePreview
- [ ] Ensure cards stretch to full width
- [ ] Check all temperatures display correctly

### Completion Checklist:
- [ ] Four gradient weather cards display correctly
- [ ] Each card has proper gradient colors matching the reference
- [ ] Circular icon containers with semi-transparent backgrounds
- [ ] City names and temperatures are properly aligned
- [ ] Large temperature display on the right side
- [ ] Proper spacing (15px between cards, 20px padding)
- [ ] Blue AppBar with "Weather Forecast" title
- [ ] No overflow errors on different screen sizes

---

## 🎯 Final Exercise: Complete Hobby Cards App

### Goal: Build the complete app exactly as shown in the practice guide pictures

This comprehensive exercise combines all concepts: stateless widgets, assets, layouts, and styling.

### Part 1: Project Setup
- [ ] Ensure DevicePreview package is installed (`device_preview: ^1.1.0`)
- [ ] Create `assets` folder in project root
- [ ] Add hobby images to `assets/` folder (travel, mountain, forest images)
- [ ] Update `pubspec.yaml` with assets configuration

**pubspec.yaml assets section:**
```yaml
flutter:
  assets:
    - assets/
```

---

### Part 2: Create Custom Stateless Widget
- [ ] Create `HobbyCard` stateless widget class
- [ ] Add required parameters: `String title`, `IconData icon`
- [ ] Add optional parameters: `Color? backgroundColor`
- [ ] Implement proper styling with Container
- [ ] Add BoxDecoration with Colors.blue background (solid color, not gradient)
- [ ] Apply rounded corners (borderRadius: 20.0)
- [ ] Add Row layout for icon and text
- [ ] Style icon with white color (size: 30px)
- [ ] Style text with white color, bold font (fontSize: 24)
- [ ] Add proper padding (horizontal: 30, vertical: 20)

**Design Specifications for Hobby Cards:**
- Container padding: horizontal 30px, vertical 20px
- Border radius: 20px
- Background color: Solid blue (Colors.blue)
- Icon: White, 30px size
- Text: White, 24px, bold
- Spacing between icon and text: 20px
- Spacing between cards: 20px
- Overall padding: 40px all sides
- AppBar: Blue background with white text

**Expected HobbyCard Structure:**
```dart
class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  
  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
```

---

### Part 3: Main App Structure
- [ ] Wrap MaterialApp with DevicePreview
- [ ] Configure DevicePreview (enabled: true)
- [ ] Add MaterialApp properties (useInheritedMediaQuery, locale, builder)
- [ ] Create Scaffold with AppBar
- [ ] Set AppBar title to "My Hobbies"
- [ ] Set AppBar backgroundColor to Colors.blue
- [ ] Set AppBar title text color to white

---

### Part 4: Body Layout
- [ ] Use Padding widget (40.0 on all sides)
- [ ] Create Column with crossAxisAlignment: CrossAxisAlignment.stretch
- [ ] Add spacing between cards using SizedBox(height: 20)
- [ ] Add three HobbyCard widgets with proper data

**Required Hobby Cards (in order):**
1. [ ] Traveling card with `Icons.travel_explore` icon
2. [ ] Reading card with `Icons.menu_book` icon  
3. [ ] Skating card with `Icons.skateboarding` icon

---

### Part 5: Final Styling & Testing
- [ ] Ensure all cards have consistent blue background
- [ ] Verify rounded corners (20px radius) on all cards
- [ ] Check white text and icons on all cards
- [ ] Test proper spacing between cards (20px)
- [ ] Verify padding around entire layout (40px)
- [ ] Test app matches the reference pictures exactly

---

### Part 6: Run & Verify
- [ ] Run `flutter pub get` to install dependencies
- [ ] Run app with DevicePreview: `flutter run -d chrome`
- [ ] Test on different device sizes in DevicePreview
- [ ] Verify layout looks exactly like practice guide pictures
- [ ] Check both portrait and landscape orientations
- [ ] Ensure no overflow errors

---

## ✅ Completion Checklist

### Visual Match:
- [ ] AppBar: Blue background with white "My Hobbies" title
- [ ] Three blue cards with rounded corners
- [ ] White icons and text on each card
- [ ] Proper spacing between all elements
- [ ] Cards stretch to full width
- [ ] Consistent padding throughout

### Code Quality:
- [ ] Custom HobbyCard stateless widget created
- [ ] Parameters properly defined with required keyword
- [ ] Proper use of const constructors
- [ ] Clean, readable code structure
- [ ] No warnings or errors

### Functionality:
- [ ] App runs without errors
- [ ] DevicePreview works correctly
- [ ] Responsive layout on different screens
- [ ] All three hobby cards display properly

---

## 📖 Reference Images

The final app should look exactly like the pictures in the practice guide showing:
- Blue AppBar with "My Hobbies" title
- Three blue rounded cards below
- Each card has an icon on the left and text on the right
- Clean, modern design with proper spacing

---

## 🎓 Key Concepts Covered

✅ **Stateless Widgets**: Creating reusable custom widgets  
✅ **Widget Parameters**: Passing data through constructor parameters  
✅ **Material Design**: Using Colors, BoxDecoration, BorderRadius  
✅ **Layout**: Column, Row, Padding, SizedBox widgets  
✅ **Styling**: TextStyle, Icon styling, Container decoration  
✅ **DevicePreview**: Testing responsive design on multiple devices

---

## 💡 Tips for Success

- Start by creating the `HobbyCard` widget first
- Test the widget with one card before adding all three
- Pay attention to exact spacing and colors from the pictures
- Use `const` constructors where possible for better performance
- Run `flutter pub get` after any pubspec.yaml changes
- Use DevicePreview to verify it looks good on different screen sizes

---

**Last Updated:** November 9, 2025  
**Project:** w5_flutter  
**Topic:** Assets and Stateless Widgets - Final Comprehensive Exercise
