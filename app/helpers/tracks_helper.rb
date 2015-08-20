module TracksHelper
  def ugly_lyrics(lyrics)
    lyrics_lines = h(lyrics).split("\n")
    html_string = ""
    lyrics_lines.each do |line|
      html_string += "&#9835 #{line}"
    end
    "<pre>#{html_string}</pre>".html_safe
  end
end
