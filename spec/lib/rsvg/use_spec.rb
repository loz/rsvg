require 'spec_helper'

describe RSVG::Use do
  subject { described_class.new :target_id }
  it_behaves_like 'svg element', :use, :target_id

  describe :to_xml do
    it "adds given target id as xlink:href" do
      subject.to_xml.attributes['xlink:href'].should == '#target_id'
    end
  end
end
