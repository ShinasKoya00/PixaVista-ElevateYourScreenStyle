# PixaVista - Elevate Your Screen Style

PixaVista is a beautiful wallpaper app that allows you to discover and set stunning wallpapers for your device. With a vast collection of high-quality images, you can easily personalize your device's home and lock screens to match your style and mood.

## Features

- **Vast Collection:** Explore a diverse collection of wallpapers, curated to cater to various tastes and preferences.
- **Search Functionality:** Easily find wallpapers by searching for specific keywords or categories.
- **Predefined Categories:** Discover wallpapers curated for various themes and moods.
- **Set as Wallpaper:** Quickly set your favorite wallpapers as your device's home or lock screen background with just a tap.
- **Save to Gallery:** Save wallpapers to your device's gallery for offline access or sharing with friends.
- **Customization Options:** Adjust wallpaper settings such as cropping, scaling, and more to fit your device's screen perfectly.

## Screenshots

  <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/splash_screen_1.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/splash_screen_2.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/loading_screen_1.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/loading_screen_2.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/no_internet_error.jpg" width="165" />
 
  <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/page_not_found_error.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/home_page.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/category_results_1.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/category_results_2.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/search_results_1.jpg" width="165" />

  <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/search_results_2.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/search_results_3.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/fulls_screen.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/saved_notification.jpg" width="165" /> <img src="https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle/blob/master/assets/application_snapshots/saved_images.jpg" width="165" />

## Installation

To get started with PixaVista, follow these steps:

1. **Clone the Repository:** Clone this GitHub repository to your local machine using the following command:
```
   git clone https://github.com/ShinasKoya00/PixaVista-ElevateYourScreenStyle.git
```

2. **Update Android Manifest:** Open the `android/app/src/main/AndroidManifest.xml` file and ensure it includes the following permission for accessing external storage (required for saving wallpapers):
```xml
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

Additionally, if not already present, add the following attribute to the `application` tag to enable legacy external storage access:
```xml
   android:requestLegacyExternalStorage="true"
```

3. **Run the App:** Navigate to the project directory and run the app on your preferred device or simulator using Flutter.
```
   cd path/to/your/PixaVista
   flutter run
```

4. **Explore and Enjoy:** Once the app is running, explore the collection of wallpapers, set your favorites, and personalize your device's screen style!


## Dependencies

SavorySafari uses the following dependencies:

- 'flutter': For building the app's UI.
- 'http': For making API requests to fetch data.
- 'cupertino_icons': For platform-specific icons on iOS.
- 'google_fonts': For using custom fonts in the app.
- 'gallery_saver_updated': For saving images to the device gallery.
- 'awesome_snackbar_content': For displaying beautiful snackbars.
- lottie': For rendering animations in the app.
- flutter_svg': For rendering SVG images in the app.


## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, feel free to [open an issue](https://github.com/your-username/pixavista/issues) or [submit a pull request](https://github.com/your-username/pixavista/pulls). We appreciate your feedback and contributions to make PixaVista even better!

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

Have questions or feedback? Feel free to reach out:

- Email: shinaskoya123@gmail.com
- GitHub: https://github.com/ShinasKoya00

Thank you for using PixaVista! Enjoy exploring and elevating your screen style!
