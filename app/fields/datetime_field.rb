require "administrate/field/base"

class DatetimeField < Administrate::Field::Base
  def to_s
    data.strftime('%m/%d/%Y %l:%M %p')
  end
end
