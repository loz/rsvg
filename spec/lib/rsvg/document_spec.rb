require 'spec_helper'

describe RSVG::Document do
  it_behaves_like 'svg element', :svg
  it_behaves_like 'parent element'
  describe :to_xml do

    it "should have svg xml namespace" do
      subject.to_xml.attributes['xmlns'].should == 'http://www.w3.org/2000/svg'
    end
  end
end
