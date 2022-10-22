import webbrowser
import requests
import time
from bs4 import BeautifulSoup
from gzip import decompress

# Match ID
mid = '206962973'
# soccer / hockey
sport = 'hockey'

####### VIEW MATCH ######
# Get 2D Analizer Link
match_url = "https://www.managerzone.com/?p=match&sub=result&type=2d&play=2d&mid=%s&changesport=%s"%(mid, sport)
# Open match in your internet browser
get_url= webbrowser.open(match_url)
time.sleep(5)

####### GET STATS ######
# Build URL
stats_url = "http://download06.managerzone.com/data/%s/%s/%s/stats%s.xml.gz"%(sport, mid[-1], mid[-2], mid)
# Get file
xmlfilegz = requests.get(stats_url)
# Get data
data = BeautifulSoup(decompress(xmlfilegz.content), 'lxml')
print(data.prettify())