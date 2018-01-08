import requests
from bs4 import BeautifulSoup

def college_proxy_spider():
    url = "http://172.31.9.69/dc/proxy"
    try:
        sourceCode = requests.get(url)
        plainText = sourceCode.text

        soup = BeautifulSoup(plainText, "html.parser")

        ipdict = {}
        for i in soup.findAll("tr",{"class":"text-success"}):
            ipdict[i.td.text] = str(i.findAll("td")[3].text).replace(" %","")
            #print(i.td.text, "\t", str(i.findAll("td")[3].text).replace(" %",""))

        #print((sorted(zip(ipdict.values(), ipdict.keys()))).pop()[1])

        return ((sorted(zip(ipdict.values(), ipdict.keys()))).pop()[1])


        # for i in soup.findAll("tr",{"class":"text-success"}):
        #     print((i.findAll("td")[4].text)

    except:
        return 0

ip = college_proxy_spider()

print(ip)