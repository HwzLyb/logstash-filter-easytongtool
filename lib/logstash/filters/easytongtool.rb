# encoding: utf-8
require "java"
require "logstash/filters/base"
require "C:\\Users\\Administrator\\Desktop\\logstash-filter-easytongtool\\easytong_tool.jar"

# This  filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an .
class LogStash::Filters::Easytongtool < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #    {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "easytongtool"

  # Replace the message with this value.
  config :message, :validate => :string, :default => "Hello World!"
  config :messageInfo, :validate => :string, :default => "未解析"

  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    if @messageInfo
      # Replace the event message with our message as configured in the
      # config file.
      jar=com.hzsun.tool.easytongtool.service.impl.new
      info = jar.parseMessage(0, messageInfo)
      event.set("messageInfo", info)
    end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Easytongtool
