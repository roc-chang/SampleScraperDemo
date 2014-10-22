require 'rubygems'  
# require 'nokogiri'  
require 'open-uri'  
task :fetch => :environment do  
  ids = Nokogiri::HTML(open("http://10.21.24.110:8080/powercms/api/ContentApi-getContentList.action?userName=superuser&token=875009be3b9d49228c17e5e22c6804b5&returnType=json"))
  json = JSON.parse(ids)
end