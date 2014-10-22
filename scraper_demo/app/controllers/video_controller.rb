class VideoController < ApplicationController
	respond_to :html,:js,:xml,:json
	def all
		@videos= Video.all
		#  respond_to do |format|
		# 	format.json {
		# 	render :json =>	@videos.to_json
		# 	}
		# end
		File.open("#{Rails.root}/tmp/videos.json", 'wb') { |file| file.write(@videos.to_json( only: [ :contentid, :title, :hits, :image, :href, :swfurl, :playurl, :videourl, :updateTime ] )) }
		respond_with @videos
	end
	def show
		@video = Video.find( params[ :id ] )
		respond_with @video
	end
end
