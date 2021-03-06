# This file is part of the KNOWtime server.
#
# The KNOWtime server is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# The KNOWtime server is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License
# along with the KNOWtime server.  If not, see <http://www.gnu.org/licenses/>.
require 'set'
require 'activerecord-import'

module GtfsEngine
  class Sources < ::BasicObject
    def initialize(config)
      @config = config
      @source_ids = ::Set.new
    end

    def method_missing(name, &block)
      source = @config.sources.__send__ name
      add_default_importers source
      source.instance_exec source, &block if ::Kernel.block_given?
      source
    end

    private

    def add_default_importers(source)
      id = source.__id__
      return if @source_ids.include? id
      @source_ids.add id

      get_method = ::Kernel.instance_method(:method).bind self
      bulk_importer = get_method.call :bulk_importer
      set_id = ::OpenStruct.new id: -1

      source.before do |etag|
        if DataSet.where(name: source.name, etag: etag).empty?
          set = DataSet.create name: source.name,
                               title: source.title,
                               etag: etag,
                               url: source.url
          set.reload
          set_id.id = set.id
        else
          ::Kernel.raise ::GtfsReader::SkipSourceError,
                         "Data Pull already exists for #{etag}"
        end
      end

      source.handlers bulk_importer, set_id, bulk: 1024 do |importer, set_id|
        agency          &importer.call( Agency, set_id )
        calendar        &importer.call( Calendar, set_id )
        calendar_dates  &importer.call( CalendarDate, set_id )
        fare_attributes &importer.call( FareAttribute, set_id )
        fare_rules      &importer.call( FareRule, set_id )
        feed_info       &importer.call( FeedInfo, set_id )
        frequencies     &importer.call( Frequency, set_id )
        stop_times      &importer.call( StopTime, set_id )
        routes          &importer.call( Route, set_id )
        shapes          &importer.call( Shape, set_id )
        stops           &importer.call( Stop, set_id )
        stop_times      &importer.call( StopTime, set_id )
        transfers       &importer.call( Transfer, set_id )
        trips           &importer.call( Trip, set_id )
      end
    end

    def bulk_importer(model_class, data_set_id_holder)
      ::Proc.new do
        bulk do |values, count, total, columns|
          id = data_set_id_holder.id
          values.each {|v| v << id }
          model_class.import (columns + [:data_set_id]), values
          ::Rails.logger.info "Inserted #{count} #{model_class} records (total: #{total})"
        end
      end
    end
  end
end
