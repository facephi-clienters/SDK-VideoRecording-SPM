// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDK-VideoRecording-SPM",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SDK-VideoRecording-SPM",
            targets: ["SDK-VideoRecording-SPM", "videoRecordingComponent"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/AgoraIO/AgoraLite_iOS.git", .upToNextMinor(from: "4.5.3")),
        .package(url: "https://github.com/daltoniam/Starscream.git", .upToNextMinor(from: "4.0.8")),
        .package(url: "https://github.com/facephi-clienters/SDK-CorePackage-SPM.git", .exactItem("2.8.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SDK-VideoRecording-SPM",
            dependencies: ["videoRecordingComponent",
                           "SDK-CorePackage-SPM",
                           .product(
                            name: "RtcBasic",
                            package: "AgoraLite_iOS"),
                           .product(
                            name: "Starscream",
                            package: "Starscream"),
                          ]
        ),
        .binaryTarget(name: "videoRecordingComponent",
        url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/SDK/FPHISDKVideoRecordingComponent/2.8.1/videoRecordingComponent.zip",
        checksum: "3456046b87ba52eebc392e07f1ec04ee62cc0dddad73fdd2b3184fd259dec537"),
    ]
)
