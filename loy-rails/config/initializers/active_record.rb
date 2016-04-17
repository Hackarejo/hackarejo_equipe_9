class ActiveRecord::Base
  def self.title(inflection = :single)
    count = (inflection == :single) ? 1 : 2
    self.model_name.human(count: count)
  end
end
