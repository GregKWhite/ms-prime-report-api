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
    truck: Field::BelongsTo,
    initial_mileage: Field::String.with_options(searchable: false),
    current_mileage: Field::String.with_options(searchable: false),
    total_gas: Field::String.with_options(searchable: false),
    total_paid: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :truck,
    :initial_mileage,
    :current_mileage,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :truck,
    :initial_mileage,
    :current_mileage,
    :total_gas,
    :total_paid,
    :created_at,
    :updated_at,
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
