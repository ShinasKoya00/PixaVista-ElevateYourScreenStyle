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
-

## Installation

To get started with PixaVista, follow these steps:

1. **Clone the Repository:** Clone this GitHub repository to your local machine using the following command:
   ```
   git clone https://github.com/your-username/pixavista.git
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

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, feel free to [open an issue](https://github.com/your-username/pixavista/issues) or [submit a pull request](https://github.com/your-username/pixavista/pulls). We appreciate your feedback and contributions to make PixaVista even better!

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

Have questions or feedback? Feel free to reach out:

- Email: shinaskoya123@gmail.com
- GitHub: https://github.com/ShinasKoya00

Thank you for using PixaVista! Enjoy exploring and elevating your screen style!
