
# Change Log
All notable changes to this project will be documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [1.0.0] - 2024-6-6
 
### Added
- More restore, upscale pipelines.
- All 6 preset modes.
- Render binding to setup video - canvas easily.

### Changed
- **Breaking.** Changed all pipeline constructors - emulate named parameters.
- Project structure. Shaders are now placed beside pipeline definition.

### Fixed
- Clamping added to pipeline outputs to avoid OOB color values.

## [0.1.5] - 2023-12-10
 
### Added

- Update readme.
- Include simple denoise pipeline.
- CNN/GAN upscale pipelines.
- CNN/GAN Denoise pipeline
- Original pipeline for passthrough

### Changed
- Pipelines are now built on top of small single stage pipelines.
 
## [0.1.4] - 2023-12-3

### Added

- First working version.
 
### Fixed
 
- Fix webpack configurations for library export.
