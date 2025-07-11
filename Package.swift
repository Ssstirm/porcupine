// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "Porcupine-iOS",
    platforms: [
        .iOS(.v13),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "Porcupine",
            targets: ["Porcupine"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/Ssstirm/ios-voice-processor.git",
            .branch("main")
        )
    ],
    targets: [
        .target(
            name: "PvPorcupineC",
            path: "lib/common",
            publicHeadersPath: "."       // 使 pv_porcupine.h 可见
        ),
        .target(
            name: "Porcupine",
            dependencies: [
                "PvPorcupineC",
                .product(name: "ios_voice_processor", package: "ios-voice-processor")
            ],
            path: ".",
            exclude: [
                "binding/ios/PorcupineAppTest",
                "binding/flutter",
                "binding/react-native",
                "binding/unity",
                "demo"
            ],
            sources: [
                "binding/ios/Porcupine.swift",
                "binding/ios/PorcupineErrors.swift",
                "binding/ios/PorcupineManager.swift"
            ],
            resources: [
               .copy("resources/keyword_files/ios/alexa_ios.ppn"),
               .copy("resources/keyword_files/ios/americano_ios.ppn"),
               .copy("resources/keyword_files/ios/blueberry_ios.ppn"),
               .copy("resources/keyword_files/ios/bumblebee_ios.ppn"),
               .copy("resources/keyword_files/ios/computer_ios.ppn"),
               .copy("resources/keyword_files/ios/grapefruit_ios.ppn"),
               .copy("resources/keyword_files/ios/grasshopper_ios.ppn"),
               .copy("resources/keyword_files/ios/hey google_ios.ppn"),
               .copy("resources/keyword_files/ios/hey siri_ios.ppn"),
               .copy("resources/keyword_files/ios/jarvis_ios.ppn"),
               .copy("resources/keyword_files/ios/ok google_ios.ppn"),
               .copy("resources/keyword_files/ios/picovoice_ios.ppn"),
               .copy("resources/keyword_files/ios/porcupine_ios.ppn"),
               .copy("resources/keyword_files/ios/terminator_ios.ppn"),
               .copy("lib/common/porcupine_params.pv")
            ]
        )
    ]
)
