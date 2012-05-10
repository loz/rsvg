require 'spec_helper'

describe RSVG::Line do
  it_behaves_like 'svg element', :line

  describe "default" do
    subject { described_class.new }

    it "has style of 2pt black line" do
      subject.attributes[:style].should == {
        'stroke-width' => "2pt",
        :stroke => :black
      }
    end
  end
end
