require 'spec_helper'

describe RSVG::Document do
  describe :to_xml do
    it_behaves_like 'svg element', :svg

    it "should have svg xml namespace" do
      subject.to_xml.attributes['xmlns'].should == 'http://www.w3.org/2000/svg'
    end
  end
end
