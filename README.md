# Advanced Mobile Calculator

A comprehensive Flutter calculator application with multiple modes, scientific functions, history, and theme support.

## Features

- **Three Calculator Modes**: Basic, Scientific, Programmer
- **Expression Evaluation**: Supports complex mathematical expressions with proper operator precedence
- **Scientific Functions**: Trigonometric, logarithmic, power operations, constants (π, e)
- **Memory Functions**: M+, M-, MR, MC
- **Calculation History**: Persistent storage of previous calculations
- **Theme Support**: Light, Dark, and System themes
- **Settings**: Customizable decimal precision, angle mode, etc.
- **Animations**: Smooth button presses and mode transitions
- **Responsive Design**: Works on different screen sizes

## Screenshots

(Add screenshots here)

## Installation

1. Ensure Flutter is installed: https://flutter.dev/docs/get-started/install
2. Clone the repository
3. Run `flutter pub get`
4. Run `flutter run`

## Usage

- Switch between modes using the mode selector at the top
- Tap buttons to input expressions
- Use '=' to calculate
- Access history and settings via the app bar

## Architecture

- **State Management**: Provider pattern
- **Data Persistence**: SharedPreferences
- **Expression Parsing**: math_expressions package
- **UI Components**: Custom widgets with animations

## Testing

Run unit tests: `flutter test`

## Dependencies

- provider: ^6.1.1
- shared_preferences: ^2.2.2
- math_expressions: ^2.4.0
- intl: ^0.18.1

## Known Limitations

- Programmer mode is simplified
- Some advanced functions may need refinement

## Future Improvements

- Landscape mode support
- Voice input
- Graph plotting
- Export history

## Submission

This project is submitted as part of the Advanced Mobile Calculator assignment.
