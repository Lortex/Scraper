require 'nokogiri'

class Comment
attr_reader :doc, :user, :days_ago, :comment 
  def initialize(theuser, days_ago, comment)
    @user = theuser
    @days_ago = days_ago
    @comment = comment
  end

  def self.create(comment_data)
    comment = comment_data.css('span.c00').text.split('-----')[0].strip
    user = comment_data.css('a').first.text
    days_since = comment_data.css('a')[1].text
    poster = Comment.new(user, days_since, comment)
  end

end
