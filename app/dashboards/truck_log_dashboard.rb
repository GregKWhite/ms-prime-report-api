require "administrate/base_dashboard"

class TruckLogDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    price: Field::String.with_options(searchable: false),
    performed_on: Field::DateTime.with_options(searchable: false),
    description: Field::Text.with_options(searchable: false),
    mileage: Field::String.with_options(searchable: false)
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :performed_on,
    :mileage,
    :price,
    :description
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :performed_on,
    :mileage,
    :price,
    :description
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :performed_on,
    :mileage,
    :price,
    :description
  ].freeze

  # Overwrite this method to customize how trucks are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(truck_log)
    truck_log.performed_on
  end
end
