// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "TemperatureCalculations",
  platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
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
