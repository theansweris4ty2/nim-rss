import rss, std/httpclient, std/terminal, std/uri
proc get_feed () =
  let client = newHttpClient()
  for line in lines("feeds.config"): 
    var res = initUri()
    parseUri(line, res)
    var feed = getRSS(line)
    stdout.styledWriteline( fgBlue, "--- Feed Title: ", feed.title, " --- \n")
    for  index, item in feed.items:
      if index < 5:
        stdout.styledWriteline(fgGreen, item.title )
        echo "\nDate: ", item.pubDate
        echo "\nSummary: ", item.description[0..min(100, item.description.len-1)], "... \n"
        stdout.styledWriteline(fgCyan, item.link)
        echo "\n"

get_feed()

