
def descarga(video)
  `youtube-dl --extract-audio --audio-format mp3 #{video}`
  `ls *.mp3`.strip
end

def borrar
  `rm *.mp3`
end
