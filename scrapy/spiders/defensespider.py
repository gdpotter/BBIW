from scrapy.contrib.linkextractors import LinkExtractor
from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor
from scrapy.contrib.spiders import CrawlSpider, Rule
from bbiw.items import BbiwItem
import dateutil.parser

"""
Instantiates the spider, just with the name, domain, starting location and follow rules
"""
class defenseDataSpider(CrawlSpider):
    name = "defensedata"
    #Cannot include any extentions off .gov
    allowed_domains = ["catalog.data.gov"]
    #The url to start scraping at
    start_urls = [
        "http://catalog.data.gov/harvest/dod-json",
    ]

    #The rules to follow to links. The first rule is to click on each data set and to go to that page and see
    #What is there and save it, that is what the parse_dataset is doing

    #The second rule is the find the next button and follow through it. Had to go to the settings.py file and ensure
    #That depth_limit was 0 so it would follow it to the end
    rules =  (
        Rule(LinkExtractor(allow=("http://catalog.data.gov/dataset", "http://catalog.data.gov/harvest"),
            restrict_xpaths=('//h3[@class="dataset-heading"]/a',)),
            callback='parse_dataset'),
        Rule(LinkExtractor(allow=("http://catalog.data.gov/harvest"),
         restrict_xpaths=('//div[@class="pagination pagination-centered"]/ul/li/a[string(number(text()))="NaN"]',))),
    )

    #This is simply a bunch of xpath tag extractions should look into using the
    #scrapy shell to find out which paths are what, can see by reading this it is pretty straightforward
    #Also pretty easy to learn on W3 Schools.
    def parse_dataset(self, response):
        item = BbiwItem()

        item['url'] = response.url
        item['title'] = response.xpath('//section[@class="module-content"]/h1/text()').extract()[0].strip()
        item['desc'] = [x.strip() for x in response.xpath('//div/p/text()').extract()]
        item['desc'] = "".join(item['desc'])
        item['links'] = response.xpath('//section[@id="dataset-resources"]/ul[@class="resource-list"]/li/div[@class="btn-group"]/a/@href').extract()
        item['publisher'] = response.xpath('//section[@class="module-content additional-info"]/table/tbody/tr[@itemprop="publisher"]/td/span/text()').extract()[0]
        item['updated'] = [x.strip() for x in response.xpath('//section[@class="module-content additional-info"]/table/tbody/tr/th[text()="Last Update"]/following-sibling::*[1]/text()').extract()][0]
        item['updated'] = dateutil.parser.parse(item['updated']).strftime("%Y-%m-%dT%H:%M:%SZ");
        item['category'] = [x.strip() for x in response.xpath('//section[@class="module-content additional-info"]/table/tbody/tr/th[text()="Category"]/following-sibling::*[1]/text()').extract()]
        item['category'] = filter(None, [x.strip() for z in item['category'] for x in z.split(',')])
        item['category'].append('Defense')

        return item
