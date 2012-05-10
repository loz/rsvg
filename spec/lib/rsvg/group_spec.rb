require 'spec_helper'

describe RSVG::Group do
  it_behaves_like 'svg element', :g
  it_behaves_like 'parent element'
end
