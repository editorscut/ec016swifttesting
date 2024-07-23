// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "TemperatureCalculations",
  platforms: [.macOS(.v14), .iOS(.v17), .tvOS(.v17),
              .watchOS(.v10), .macCatalyst(.v17)],
  products: [
    .library(
      name: "TemperatureCalculations",
      targets: ["TemperatureCalculations"]),
  ],
  targets: [
    .target(
      name: "TemperatureCalculations"),
    .testTarget(
      name: "TemperatureCalculationsTests",
      dependencies: ["TemperatureCalculations"]
    ),
  ]
)
