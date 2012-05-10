require 'spec_helper'

describe RSVG::Ellipse do
  it_behaves_like 'svg element', :ellipse

  describe "default" do
    subject { described_class.new }

    it "has xradius 100px, yradius 50px" do
      subject.attributes[:rx].should == 100
      subject.attributes[:ry].should == 50
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
