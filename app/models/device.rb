class Device < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  attr_accessor :nice_name

  def decorate
    DeviceDecorator.new(self)
  end

  def device_name
    DeviceTracking::DeviceName.call(UserAgentParser::Parser.new, self)
  end
end