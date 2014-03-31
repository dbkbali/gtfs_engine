# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "gtfs-engine"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jon Sangster"]
  s.date = "2014-03-31"
  s.description = "Reads and parses zip files conforming to Google's GTFS spec. GTFS Spec: https://developers.google.com/transit/gtfs"
  s.email = "jon@ertt.ca"
  s.executables = ["rails"]
  s.files = [
    "Rakefile",
    "app/controllers/gtfs_engine/application_controller.rb",
    "app/controllers/gtfs_engine/stops_controller.rb",
    "app/helpers/gtfs_engine/application_helper.rb",
    "app/helpers/gtfs_engine/stop_helper.rb",
    "app/models/gtfs_engine/calendar.rb",
    "app/models/gtfs_engine/calendar_date.rb",
    "app/models/gtfs_engine/data_set.rb",
    "app/models/gtfs_engine/route.rb",
    "app/models/gtfs_engine/shape.rb",
    "app/models/gtfs_engine/stop.rb",
    "app/models/gtfs_engine/stop_time.rb",
    "app/models/gtfs_engine/trip.rb",
    "app/views/gtfs_engine/stops/index.json.jbuilder",
    "app/views/gtfs_engine/stops/show.json.jbuilder",
    "app/views/layouts/gtfs_engine/application.html.erb",
    "config/routes.rb",
    "db/migrate/20140320045108_create_gtfs_engine_data_sets.rb",
    "db/migrate/20140320045232_create_gtfs_engine_calendars.rb",
    "db/migrate/20140320045751_create_gtfs_engine_calendar_dates.rb",
    "db/migrate/20140320050100_create_gtfs_engine_shapes.rb",
    "db/migrate/20140320051140_create_gtfs_engine_routes.rb",
    "db/migrate/20140320052005_create_gtfs_engine_stops.rb",
    "db/migrate/20140320052508_create_gtfs_engine_trips.rb",
    "db/migrate/20140320052907_create_gtfs_engine_stop_times.rb",
    "lib/gtfs_engine.rb",
    "lib/gtfs_engine/engine.rb",
    "lib/gtfs_engine/source.rb",
    "lib/gtfs_engine/sources.rb",
    "lib/gtfs_engine/version.rb",
    "lib/tasks/gtfs_engine_tasks.rake"
  ]
  s.homepage = "http://github.com/sangster/gtfs-engine"
  s.licenses = ["GPL 3"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Read General Transit Feed Specification zip files"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 4.0"])
      s.add_runtime_dependency(%q<gtfs-reader>, [">= 0"])
      s.add_runtime_dependency(%q<activerecord-import>, [">= 0"])
      s.add_development_dependency(%q<pry-rails>, ["~> 0.3"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 4.2"])
    else
      s.add_dependency(%q<rails>, ["~> 4.0"])
      s.add_dependency(%q<gtfs-reader>, [">= 0"])
      s.add_dependency(%q<activerecord-import>, [">= 0"])
      s.add_dependency(%q<pry-rails>, ["~> 0.3"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_dependency(%q<guard-rspec>, ["~> 4.2"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 4.0"])
    s.add_dependency(%q<gtfs-reader>, [">= 0"])
    s.add_dependency(%q<activerecord-import>, [">= 0"])
    s.add_dependency(%q<pry-rails>, ["~> 0.3"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
    s.add_dependency(%q<guard-rspec>, ["~> 4.2"])
  end
end

