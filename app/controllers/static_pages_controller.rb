class StaticPagesController < ApplicationController
  
  def home
  end

  def shuffle
    #channel = Yt::Channel.new id: 'UC4rasfm9J-X4jNl9SvXp8xA'
    
    #Only create playlist the first time
    @listRepeat = JSON.load(params[:listRepeat])
    @recent = JSON.load(params[:recent])

    unless @listRepeat
      @first = true
      
      @listRepeat = []
      @recent = []

      @playlist = Yt::Playlist.new id: "#{params[:list_id]}"
      @title = @playlist.title
      list = @playlist.playlist_items
      @count = list.count

      #Make array of video arrays
      list.take(@count).each do |i|
        @listRepeat << [i.title, i.position, i.video_id]
      end

      @listNoRepeat = @listRepeat

    else
      @first = false

      @listRepeat = JSON.load(params[:listRepeat])
      @listNoRepeat = JSON.load(params[:listNoRepeat])
      @recent = JSON.load(params[:recent])
      @title = params[:title]
      @count = params[:count]
    end

    @repeat = params[:repeat] ? true : false

    @listNoRepeat = rand_gen(@listRepeat, @listNoRepeat, @repeat)

    puts @listNoRepeat.count

  end


private 

  def rand_gen(listRepeat, listNoRepeat, repeat)
    newlist = listNoRepeat
    if repeat
      @rand_vid = listRepeat.sample
    else
      @rand_vid = newlist.sample
    end

    @video = Yt::Video.new id: "#{@rand_vid[2]}"

    #Last 5 recent videos
    @recent << @video.title
    @recent.shift if @recent.count > 6

    if repeat
      return listRepeat
    else
      newlist.delete(@rand_vid)
      return newlist
    end
  end


end