require "rails_helper"

class Validatable
  include ActiveModel::Validations
  attr_accessor :date
  validates :date, future_date: true
end

describe FutureDateValidator do
  subject { Validatable.new }

  context "when date is before current date" do
    before { subject.date = 1.day.ago }

    it "should be invalid" do
      expect(subject.valid?).to be_falsey
    end

    it "adds an error on model" do
      subject.valid?
      expect(subject.errors.keys).to include(:date)
    end
  end

  context "when date is equal current date" do
    before { subject.date = Date.current }

    it "should be invalid" do
      expect(subject.valid?).to be_falsey
    end

    it "adds an error on model" do
      subject.valid?
      expect(subject.errors.keys).to include(:date)
    end
  end

  context "when date is smaller of the 7 days" do
    before { subject.date = Date.current + 5.day }

    it "should be invalid" do
      expect(subject.valid?).to be_falsey
    end

    it "adds an error on model" do
      subject.valid?
      expect(subject.errors.keys).to include(:date)
    end
  end

  context "when date is equal a 7 days" do
    before { subject.date = Date.current + 7.day }

    it "should be valid" do
      expect(subject.valid?).to be_truthy
    end
  end
end