require 'open-uri'

class Domain < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessor :previous_ip

  def update_ip
    @html = open("http://ddo.jp").read
    current_ip = parse
  end

  def parse
    if @html =~ /<input type=text name=ip value="(.*)" size=30>/ then
      return $1
    end
  end
end
