require 'nokogiri'
require 'open-uri'
require_relative 'comment'



#I got most of this working. Just need to install an ARGV that will take in
#a url and parse it and instantiate a post from it
#I could also display number of comments, and ask user how many comments to put
class Post

attr_reader :doc, :title, :url, :points, :item_id, :comments_array
  #Hacker News title, post URL, points of the post, and Hacker News Item ID
  def initialize(title = nil, url = nil, points = nil, item_id = nil)
    ARGV[0]
    @doc = Nokogiri::HTML(open(ARGV[0])) 
    @title = @doc.xpath("//title").text
    @url = @doc.css('td.title a')[0]['href']
    @points = @doc.css('span.score')
    @item_id = @doc.css('.athing a')[0]['id']

    @comments_array = Array.new
  end

#return all comments associated with a particular post. in this form, its all an array
#not sure if this is what i want. rewriting it
  def comments 
    @comments_array = (@doc.css('td.default').map do |comment_data|
      Comment.create(comment_data)
    end)
    puts @comments_array.class
    #puts all_the_text = ((@doc.css('td.default span.c00').text.split('-----')).each {|comment| comment.strip})[0]
    #puts the_username = @doc.css('td.default a')
    #Comment.create(comment)
  end

  def read
    puts @comments_array[9].inspect
  end


#takes a Comment as its input and adds it to the comment list
#You will have to enter you own paramters i think for this to work???
  def add_comment
    puts Comment.new('Wils', '28 days ago', 'Wubbalubba dub dub').inspect
  end

#Instantiates a new post, parses the url, then adds comments as objects to array
  def self.create
    @post = Post.new
    @post.comments
    @post.read
  end
end

Post.create
