# frozen_string_literal: true
module DriverReportsHelper
  def location_select_options
    capture do
      concat content_tag(:option, 'All Locations', value: 'all')
      concat options_from_collection_for_select(Location.all, 'id', 'name')
    end
  end
end
