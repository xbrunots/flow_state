# shadcn_flutter
## [0.0.1]
![Pub Likes](https://img.shields.io/pub/likes/flow_state)
![Pub Points](https://img.shields.io/pub/points/flow_state)
![Pub Version](https://img.shields.io/pub/v/flow_state)
![GitHub Repo stars](https://img.shields.io/github/stars/xbrunots/flow_state)

The easiest way to make your project reactive (without the need for builders)

## Installation
#### 1. Create a new Flutter project
```bash
flutter create my_app
cd my_app
```
#### 2. Add the dependency
```bash
flutter pub add flow_state
```
#### 3. Import the package
```dart
import 'package:flow_state/flow_state.dart';
```
#### 4. Creating a viewmodel
```dart
/// extend your viewModel by assigning the type 
/// of your model (which can be a state for those who like bloc)
/// In the example below, the UserViewModel viewModel receives the UserModel model

class UserViewModel extends FlowViewModel<UserModel> {
  UserViewModel(super.context, super.state);

  /// The Model must be initialized with a default value here
  @override
  get initState => UserModel(name: 'Bruno Brito');


  /// At any time you can get the data updated in real time through state.model
  getData() => print(state.model);

  /// At any time you can change the model in real time through state.emit
  setData(value) => state.emit(value);
}


```
#### 4. Adding to page
```dart
class _TestePageState extends State<TestePage> with FlowState<UserModel> {
  ///Initially it is necessary to define the viewModel 
  ///(The viewModel must be a class that extends FlowViewModel<T>)
  @override
  UserViewModel get viewModel => UserViewModel(context, this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(model.name.toString()), ///At any time you can get the data updated in real time through model
          TextField(
            onChanged: (v) => emit(UserModel(name: v)), ///At any time you can change the model in real time through emit
          ),
          TextButton(
            child: Text('Change Model'),
            onPressed: () {
              viewModel.setData(UserModel(name: 'Jon Smitch')); ///At any time you can interact with the viewModel
            },
          ),
        ],
      ),
    );
  }
}

``` 
#### EXTRA. Using without boilerplate
```dart

/// create instance
FlowCore get flowCore => FlowCore.newInstance(context);

/// change a value
flowCore.setValue = 12;

/// change a value using emit
flowCore.emit(12);

/// read a value
print(flowCore.value);

/// listens to the values ​​emitted via stream
flowCore.stream.listen((data) => print(data));

```





Using without borderplate