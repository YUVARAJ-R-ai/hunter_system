{ pkgs ? import <nixpkgs> {} }:

let
  androidEnv = pkgs.androidenv.override { licenseAccepted = true; };
  androidComposition = androidEnv.composeAndroidPackages {
    cmdLineToolsVersion = "13.0";
    toolsVersion = "26.1.1";
    platformToolsVersion = "35.0.2";
    buildToolsVersions = [ "35.0.0" "34.0.0" ];
    includeEmulator = false;
    includeSources = false;
    includeSystemImages = false;
    platformVersions = [ "36" "35" "34" "33" "32" "31" "30" "29" "28" ];
    abiVersions = [ "x86_64" ];
    includeNDK = true;
    ndkVersions = [ "28.2.13676358" ];
    cmakeVersions = [ "3.22.1" ];
  };
  androidSdk = androidComposition.androidsdk;
in
pkgs.mkShell {
  buildInputs = [
    androidSdk
    pkgs.jdk17
    pkgs.flutter
  ];

  ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
  ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
  JAVA_HOME = "${pkgs.jdk17}";

  shellHook = ''
    export PATH="${androidSdk}/libexec/android-sdk/platform-tools:$PATH"
    export PATH="${androidSdk}/libexec/android-sdk/tools/bin:$PATH"
    flutter config --android-sdk "${androidSdk}/libexec/android-sdk" 2>/dev/null
    echo "Android SDK: $ANDROID_HOME"
    echo "ADB: $(which adb)"
  '';
}
