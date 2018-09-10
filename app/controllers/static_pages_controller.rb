class StaticPagesController < ApplicationController
  
  def home
    #channel = Yt::Channel.new id: 'UC4rasfm9J-X4jNl9SvXp8xA'
    
    #playlist = Yt::Playlist.new id: 'UU4rasfm9J-X4jNl9SvXp8xA'
    #@title = playlist.title
    #@list = playlist.playlist_items
    #@count = @list.count
    #@goodlist = @list.take(@count)

    #@rand_vid = @goodlist.sample

    #@video = Yt::Video.new id: "#{@rand_vid.video_id}"
    @video = Yt::Video.new id: "TOKHdJO_u2A"

  end

end
