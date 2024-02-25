# Si Rene App

Si Rene is a one-stop emergency app. It provides a faster way for users to call and track services in moments of emergency by eliminating call centers as intermediaries. Users only need to tap a button and speak of their emergency – all other information like location and user identity are automatically relayed to the service.

Technologies used `Flutter` `Firebase` `Google Maps API` `Node.js` `Google Cloud Platform`

</br>

## App Preview

![Frame 4326](https://github.com/4thePeepsTeam/Si-Rene/assets/76770366/e035d728-046a-4144-b199-76b211520f63)

![Frame 4327](https://github.com/4thePeepsTeam/Si-Rene/assets/76770366/7f7d540a-8a25-414c-a2cb-3e7db447730b)

</br>

## How to Install the App
Go to [Releases](https://github.com/4thePeepsTeam/Si-Rene/releases/) and download the `.apk` file, then install it on your Android device.

</br>

## Run The Project Locally

Requirements, ensure you have the following installed on your local machine:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version `3.16.x` recommended)
- [Java Development Kit](https://www.oracle.com/id/java/technologies/downloads/#java17) (version `17.0.x` recommended)
- [Git](https://git-scm.com/)
  
Follow these steps to run the project on your local machine:

1.  Clone the repository
   
    ```bash
    git clone https://github.com/4thePeepsTeam/Si-Rene.git
    ```
    
2.  Navigate to the project's directory

    ```bash
    cd Si-Rene
    ```

3.  Install the dependencies

    ```bash
    flutter pub get
    ```

4. Create and setup `private.dart` file on using template provided in `private.dart.example`
  
5. Replace `YOUR_GOOGLE_API_KEY_HERE` with your Google Maps Api Key on `android/app/src/main/androidmanifest.xml`
   
   ```xml
   <!-- android/app/src/main/androidmanifest.xml -->
   ...
   <meta-data android:name="com.google.android.geo.API_KEY" android:value=YOUR_GOOGLE_API_KEY_HERE/>
   ``` 
    
7.  Run the app

    ```bash
    flutter run
    ```

</br>

---

Developed by 4thePeeps Team:
-  Thoriq Ibrahim Farras 
-  Ahmad Bagas Aditya Ilham Aulia 
-  Nabil Mutawakkil Qisthi 
-  Almaas Izdihar Sant
