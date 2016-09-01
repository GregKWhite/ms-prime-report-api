require "administrate/base_dashboard"

class DriverReportDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    driver: Field::BelongsTo,
    helper: Field::BelongsTo.with_options(class_name: "Driver"),
    location: Field::BelongsTo,
    truck: Field::BelongsTo,
    id: Field::Number,
    gallons: Field::String.with_options(searchable: false),
    amount_paid: Field::String.with_options(searchable: false),
    mileage: Field::String.with_options(searchable: false),
    notes: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :driver,
    :helper,
    :location,
    :truck,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :driver,
    :helper,
    :location,
    :truck,
    :gallons,
    :amount_paid,
    :mileage,
    :notes,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :driver,
    :helper,
    :location,
    :truck,
    :gallons,
    :amount_paid,
    :mileage,
    :notes,
  ].freeze

  # Overwrite this method to customize how driver reports are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(driver_report)
  #   "DriverReport ##{driver_report.id}"
  # end
end