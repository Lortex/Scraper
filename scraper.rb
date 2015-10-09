require 'nokogiri'
require_relative 'post'

doc = Nokogiri::HTML(File.open('post.html'))

#extracts all usernames
  def extract_usernames(doc)
    doc.search('.comhead > a:first-child').map { |element| element.inner_text }
  end

#returns of a string containing the points amount for the numbah one post
  def search1(doc)
    doc.search('.subtext > span:first-child').map { |span| span.inner_text}
  end

#returns the id number of the 3rd post as a... an array
  def search2(doc)
    doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
  end

#i... do not know. some sort of object
  def search3(doc)
    doc.search('.title > a:first-child').map { |link| link.inner_text}
  end


  def search4(doc)
    doc.search('.title > a:first-child').map { |link| link['href']}
  end


  def search5(doc)
    doc.search('.comment > font:first-child').map { |font| font.inner_text}
  end

#Trying to figure out what data I'm working with

puts search3(doc)
puts search4(doc)
puts search5(doc)
#puts search1(doc).class
#was just looking at the object
#puts doc.class
