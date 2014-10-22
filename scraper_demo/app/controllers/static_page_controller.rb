require 'rubygems'  
# require 'nokogiri'  
require 'open-uri' 
require 'json'
class StaticPageController < ApplicationController
	def home
  		@jsonResults = JSON::parse(open('http://www.cnpc.com.cn/powercms/api/ContentApi-getContentList.action?userName=superuser&token=875009be3b9d49228c17e5e22c6804b5&returnType=json&size=300').read)
  		@jsonResults.each do |single|
  			if !single['playurl'].empty? 
	  			@playurl = single['playurl'].gsub('10.21.24.110:8080','www.cnpc.com.cn')
	  			@video=Video.new(contentid:single['id'], title: single['title'],updateTime: single['updateTime'], hits: single['hits'], swfurl: single['swfurl'], href: single['href'], image: single['image'], playurl: @playurl)
	  			if @video.save
	  				@videohtml=open(@playurl).read
	  				reg=/http:.*\.(mp4|flv)/i

	  				if !reg.match(@videohtml).nil?
						 @videourl=reg.match(@videohtml)[0]
						 @video.update_attributes(videourl: @videourl)
					end
	  			end
  			end
  		end
  		@videos = Video.all
	end
end

		# def home
		 # @ids = Nokogiri::XML(open("http://10.21.24.110:8080/powercms/api/ContentApi-getContentList.action?userName=superuser&token=875009be3b9d49228c17e5e22c6804b5&returnType=xml"))
		# uri = 'http://www.cnpc.com.cn/powercms/api/ContentApi-getContentList.action?userName=superuser&token=875009be3b9d49228c17e5e22c6804b5&returnType=json'
		# response = nil
		#  begin
		#       open(uri) do |http|
		#         	response = http.read
		#       end
		#       @json = JSON::parse(response)

		#     # rescue => text
		#     #   # 异常处理
		#     #   logger.error("GetMailListserror=" + text)
		#       flash.now[:error] = '获取邮件列表失败。'
  #   		end
# JSON.parse(open('http://www.cnpc.com.cn/powercms/api/ContentApi-getContentList.action?userName=superuser&token=875009be3b9d49228c17e5e22c6804b5&returnType=json').read)
