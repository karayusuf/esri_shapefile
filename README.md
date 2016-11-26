# EsriShapefile

Ruby library to read an [ESRI Shapefile](https://www.esri.com/library/whitepapers/pdfs/shapefile.pdf)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'esri_shapefile'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install esri_shapefile

## Usage

##### Read the header of a shapefile

```ruby
require 'esri_shapefile'
reader = EsriShapefile::Reader.new("/path/to/shapefile")
reader.main_file_header # => Instance of EsriShapefile::MainFileHeader
```

##### Read all of the records in a shapefile.

Supported shapes can be found [here](lib/esri_shapefile/models/shapes)

```ruby
require 'esri_shapefile'
reader = EsriShapefile::Reader.new("path/to/shapefile")
reader.each_record do |header, shape|
  # Iterate over each record with access to the header and shape.
  # The header will be an instance of the EsriShapefile::RecordHeader class.
  # The shape will be one of the shape models found in the models/shapes directory. Example: EsriShapefile::Shapes::Polygon
end
```

## Contributing

1. Fork it ( https://github.com/karayusuf/esri_shapefile/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
