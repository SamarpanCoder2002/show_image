👉 **_show_image_**: A simple flutter package used to show any kind of image(asset, file, network) without passing image type.

### Latest Version: 
```
show_image: 0.0.1
```


## ⭐ Features

#### 1. Automatically recognize which type of image and show it. Only have to pass the image path. See the below example.

#### 2. Customize image with cover, filled and more.

#### 3. Click the image to open in full-screen. Having the option to restrict open in large screen on click.

#### 4. Having the option to set customized border radius, background color(with light and dark mode), width and height of the image.

#### 🎗️ Keep in mind: if `bgColor` and `isLightMode` both given, `bgColor` only applicable.

## Usage

```dart
/// With network Image
const SizedBox(
    height: 300,
    width: 300,
    child: ShowImage(imagePath: 'https://img.icons8.com/fluency/344/filled-like.png'),
    ),

/// With asset Image
const SizedBox(
    height: 300,
    width: 300,
    child: ShowImage(imagePath: 'assets/images/gps.png'),
    ),

/// With file Image
const SizedBox(
    height: 300,
    width: 300,
    child: ShowImage(imagePath: '/data/user/0/com.example.show_image_tester/cache/image_picker4569168379202702965.jpg'),
    ),
```

## Additional information

### Pull Requests are welcome