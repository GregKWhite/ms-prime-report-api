require "administrate/field/base"

class BelongsToField < Administrate::Field::BelongsTo
  def to_s
    data.presence&.send(display)
  end

  def display
    options[:display] || :name
  end
end
