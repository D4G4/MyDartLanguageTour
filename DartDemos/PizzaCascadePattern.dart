class Pizza {
  //One cool thing about Dart is that instance variables implement implicit getters and setters.
  //If the instances are final, setters don't get generated.
  List<String> toppings;
  String sauce;
  bool hasExtraCheese;

  @override
  String toString() {
    return 'Toppings : $toppings '
        'Sauce: $sauce '
        'ExtraCheese? $hasExtraCheese';
  }
}

void main() {
  var pizza = new Pizza()
    ..toppings = ['pepperoni', 'mushrooms']
    ..sauce = 'spaghetti'
    ..hasExtraCheese = true;

  print(pizza.toString());
}

/**
 * Cascades (..) allow you to make a sequence of operations on the same object.
 * In addition to function calls, you can also access fields on that same object.
 * This often saves you the step of creating a temporary variable and allows you to write more fluid code.
    Consider the following code:
    __________________________________________________________
    |                                                         |
    | querySelector('#confirm') // Get an object.             |
    |   ..text = 'Confirm' // Use its members.                |
    |   ..classes.add('important')                            |
    |   ..onClick.listen((e) => window.alert('Confirmed!'));  |
    |_________________________________________________________|

 * The first method call, querySelector(), returns a selector object.
 * The code that follows the cascade notation operates on this selector object,
 * ignoring any subsequent values that might be returned.

 * The previous example is equivalent to:
     ______________________________________________________________
    |  var button = querySelector('#confirm');                    |
    |  button.text = 'Confirm';                                   |
    |  button.classes.add('important');                           |
    |  button.onClick.listen((e) => window.alert('Confirmed!'));  |
    |_____________________________________________________________|
 */
