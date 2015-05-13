# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy

class BbiwItem(scrapy.Item):
    url = scrapy.Field()
    title = scrapy.Field()
    desc = scrapy.Field()
    links = scrapy.Field()
    publisher = scrapy.Field()
    updated = scrapy.Field()
    category = scrapy.Field()
