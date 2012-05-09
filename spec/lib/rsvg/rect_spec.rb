require 'spec_helper'

describe RSVG::Rect do
  it_behaves_like 'svg element', :rect

  describe "default" do
    subject { described_class.new }

    it "has width and height 100px" do
      subject.attributes[:width].should == 100
      subject.attributes[:height].should == 100
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
