require "administrate/base_dashboard"

class WeeklyReportDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    truck: BelongsToField.with_options(display: :identifier),
    initial_mileage: Field::String.with_options(searchable: false),
    current_mileage: Field::String.with_options(searchable: false),
    miles_driven: Field::String.with_options(searchable: false),
    total_gas: Field::String.with_options(searchable: false),
    total_paid: Field::Number.with_options(prefix: "$", decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :truck,
    :initial_mileage,
    :current_mileage,
    :miles_driven,
    :total_gas,
    :total_paid,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :truck,
    :initial_mileage,
    :current_mileage,
    :miles_driven,
    :total_gas,
    :total_paid,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :truck,
    :initial_mileage,
    :current_mileage,
    :total_gas,
    :total_paid,
  ].freeze

  # Overwrite this method to customize how weekly reports are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(weekly_report)
  #   "WeeklyReport ##{weekly_report.id}"
  # end
end
