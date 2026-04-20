import rss, std/httpclient
proc get_feed () =
  let client = newHttpClient()

  let feedUrls = ["https://feeds.feedburner.com/IeeeSpectrumFullText","https://www.wired.com/feed/rss", "https://feeds.npr.org/1002/rss.xml"] 
  
  for feed in feedUrls:
    let feed = getRSS(feed)

    echo "--- Feed Title: ", feed.title, " ---"

    for item in feed.items:
      echo "\nTitle: ", item.title
      echo "\nLink: ", item.link
      echo "\nDate: ", item.pubDate
      echo "\nSummary: ", item.description[0..min(100, item.description.len-1)], "..."

get_feed()