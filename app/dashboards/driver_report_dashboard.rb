require "administrate/base_dashboard"

class DriverReportDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    driver: BelongsToField,
    helper: BelongsToField.with_options(class_name: 'Driver'),
    location: BelongsToField,
    truck: BelongsToField.with_options(display: :identifier),
    id: Field::Number,
    gallons: Field::Number.with_options(decimals: 2),
    amount_paid: Field::Number.with_options(prefix: "$", decimals: 2),
    mileage: Field::Number.with_options(decimals: 2),
    notes: TextField,
    created_at: DatetimeField,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :created_at,
    :driver,
    :helper,
    :truck,
    :mileage,
    :gallons,
    :amount_paid,
    :notes,
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
    :created_at,
  ].freeze

  # Overwrite this method to customize how driver reports are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(driver_report)
  #   "DriverReport ##{driver_report.id}"
  # end
end
