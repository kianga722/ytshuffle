class StaticPagesController < ApplicationController
  
  def home
  end

  def shuffle
    #channel = Yt::Channel.new id: 'UC4rasfm9J-X4jNl9SvXp8xA'
    
    #Only create playlist the first time
    @list = JSON.load(params[:list])

    unless @list
      @goodlist = []
      @playlist = Yt::Playlist.new id: "#{params[:list_id]}"
      @title = @playlist.title
      @list = @playlist.playlist_items
      @count = @list.count

      #Make array of video arrays
      @list.take(@count).each do |i|
        @goodlist << [i.title, i.position, i.video_id]  
      end
    else
      @goodlist = JSON.load(params[:goodlist])
      @title = params[:title]
      @count = params[:count]
    end

    @rand_vid = @goodlist.sample

    @video = Yt::Video.new id: "#{@rand_vid[2]}"
  end

end
