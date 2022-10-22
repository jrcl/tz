library(XML)

# Match ID
mid = '206962973'
# soccer / hockey
sport = 'hockey'

####### VIEW MATCH ######
# Get 2D Analizer Link
match_url <- sprintf("'https://www.managerzone.com/?p=match&sub=result&type=2d&play=2d&mid=%s&changesport=%s'", mid, sport)

# Open in Microsoft Windows
# shell.exec(match_url)
# Open in GNU Linux
system(paste("google-chrome-stable", match_url))
Sys.sleep(5)


####### GET STATS ######
# Built URL
stats_url <- sprintf("http://download06.managerzone.com/data/%s/%s/%s/stats%s.xml.gz",
              sport,
              substr(mid,nchar(mid),nchar(mid)),
              substr(mid,nchar(mid)-1,nchar(mid)-1),
              mid)
# Temp File
tmp <- tempfile()
# Get File
download.file(stats_url,tmp)
# Gunzip
gzfile(tmp, 'rt')
# Get data
data <- xmlParse(tmp)
# Convert to List
xml_data <- xmlToList(data)