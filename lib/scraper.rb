require 'open-uri'
require 'pry'
class Scraper
  
  def self.scrape_index_page(index_url)
    students = []
    
    html = open(index_url)
    index_page = Nokogiri::HTML(html)
    
    index_page.css('div.student-card').each do |student|
      student_info = {}
      student_info[:name] = student.css('h4.student-name').text
      student_info[:location] = student.css('p.student-location').text
      student_info[:url] = student.css('a').attribute('href').value
      students << student_info
    end
      students
  end

  def self.scrape_profile_page(profile_url)
  end

end