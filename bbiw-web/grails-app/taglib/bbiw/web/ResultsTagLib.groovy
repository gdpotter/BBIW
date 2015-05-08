package bbiw.web

class ResultsTagLib {
    static defaultEncodeAs = [taglib:'raw']

    def images = [
            'something': 'something.png'
    ].withDefault { 'justice.png' }

    def resultImage = { attrs, body ->
        def image = images[attrs.publisher]

        out << '<img src="'
        out << g.resource(dir:'images', file:'justice.png')
        out << """" alt="${attrs.publisher}" />"""
    }
}
