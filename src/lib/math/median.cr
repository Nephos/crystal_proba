module Math::Median
  def median
    return 0.0_f64 if empty?
    sorted = sort
    size = size()
    return sorted[(size - 1) / 2] / 1.0 if size.odd?
    (sorted[(size / 2) - 1] + sorted[size / 2]) / 2.0
  end
end

module Enumerable(T)
  include Math::Median
end
