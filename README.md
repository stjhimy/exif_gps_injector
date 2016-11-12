# Exif GPS Injector

Add GPS exif tags to images/videos based on a kml file

## Google KML files

Google updated their KML files structure after 2016/04 making the injector fails.
The only accepted format is the old one you can see [here](https://github.com/stjhimy/exif_gps_injector/blob/master/spec/fixtures/history.kml).

## Installation

```ruby
  gem install exif_gps_injector
```

## Usage

### Command line

Copy images and kml to the same folder:

```
❯❯❯ exif_gps_injector --help
Usage: exif_gps_injector [options]
        --fallback-location LOCATION Fallback to this location if can't locate on kml
        --gps-refs REFS              Default South/West
        --input-dir INPUT_DIR        Directory to read media files, default to ./
        --kml-dir KML_DIR            Directory to read the kml files, default to ./
        --max-distance-time DISTANCE KML max distance in time from original date
        --replace-original-files     Default to false
```

```
❯❯❯ exif_gps_injector --replace-original-files
23 files found
2621 location points

Injecting: |======================================================================

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
