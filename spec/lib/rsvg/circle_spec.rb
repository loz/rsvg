require 'spec_helper'

describe RSVG::Circle do
  it_behaves_like 'svg element', :circle

  describe "default" do
    subject { described_class.new }

    it "has radius 100px" do
      subject.attributes[:r].should == 100
    end

    it "has style of 2pt black border, grey fill" do
      subject.attributes[:style].should == {
        'stroke-width' => "2pt",
        :stroke => :black,
        :fill => "#dddddd"
      }
    end
  end
end
