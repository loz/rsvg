require 'spec_helper'

describe RSVG::Link do
  it_behaves_like 'svg element', :a
  it_behaves_like 'parent element'

  describe "default" do
    subject { described_class.new }

    it "has target _top" do
      subject.attributes[:target].should == "_top"
    end
  end

  describe :to_xml do
    it "prefixes href with xlink namespace" do
      subject.attributes[:href] = 'the_href'
      subject.to_xml.attributes['xlink:href'].should == 'the_href'
    end
  end
end
