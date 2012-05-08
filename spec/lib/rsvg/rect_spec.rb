require 'spec_helper'

describe RSVG::Rect do
  describe :to_xml do
    it_behaves_like 'svg element', :rect
  end
end
