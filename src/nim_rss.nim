import rss, std/httpclient, std/terminal, std/uri
proc get_feed () =
  let client = newHttpClient()

 
  for line in lines("feeds.config"): 
    var res = initUri()
    parseUri(line, res)
    var feed = getRSS(line)

    echo "--- Feed Title: ", feed.title, " ---"

    for item in feed.items:
      let title = item.title
      stdout.styledWriteline(fgRed, title)
      echo "\nLink: ", item.link
      echo "\nDate: ", item.pubDate
      echo "\nSummary: ", item.description[0..min(100, item.description.len-1)], "..."

get_feed()

