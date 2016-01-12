# Exif GPS Injector

Add GPS exif tags to image/video based on a kml file.

## Installation

```ruby
  gem install exif_gps_injector
```

## Usage

### Command line

Copy images and kml to the same folder:

```
exif_gps_injector --help
Usage: exif_gps_injector [options]
        --kml-dir                    Directory to read the kml files, default to ./
        --input-dir                  Directory to read media files, default to ./
        --replace-original-files     Default to false
        --fallback-location          Fallback to this location if can't locate on kml files eg: '-42.0000 -10.0000 0'
        --gps-refs                   Default South/West
```

```
exif_gps_injector --kml-dir "./" --input-dir "./" --replace-original-files
70 files found
459 location points

Injecting: |===================================================================|

 Finished!
```

### Ruby

```ruby
  kml = ExifGpsInjector::Kml.new(dir: options[:kml_dir])
  kml.locate_at('2015-01-01 12:00') => '-42.000 -10.000 0'

  media = ExifGpsInjector::Media.new('./image.jpg')
  media.original_date_time  => '2015-01-01 12:00'
  media.location = { gps_latitude: '-10.000', gps_longitude: '-42.000', gps_altitude: 0 }
```


## License

MIT License. Copyright 2016 Jhimy Fernandes Villar.
