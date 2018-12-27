class StaticPagesController < ApplicationController
  
  def home
  end

  def shuffle
    #channel = Yt::Channel.new id: 'UC4rasfm9J-X4jNl9SvXp8xA'
    
    #Only create playlist the first time
    @list = JSON.load(params[:list])
    @recent = JSON.load(params[:recent])

    unless @list

      @first = true
      @repeat = params[:repeat] ? true : false

      @goodlist = []
      @recent = []

      @playlist = Yt::Playlist.new id: "#{params[:list_id]}"
      @title = @playlist.title
      @list = @playlist.playlist_items
      @count = @list.count

      #Make array of video arrays
      @list.take(@count).each do |i|
        @goodlist << [i.title, i.position, i.video_id]  
      end

    else

      @first = false
      @repeat = params[:repeat] == 'true' ? true : false

      @goodlist = JSON.load(params[:goodlist])
      @recent = JSON.load(params[:recent])
      @title = params[:title]
      @count = params[:count]

    end

    @goodlist = rand_gen(@goodlist, @repeat)

  end


private 

  def rand_gen(goodlist, repeat)
    newlist = goodlist
    @rand_vid = newlist.sample
    @video = Yt::Video.new id: "#{@rand_vid[2]}"

    #Last 5 recent videos
    @recent << @video.title
    @recent.shift if @recent.count > 6

    newlist.delete(@rand_vid) unless repeat
    return newlist
  end


end