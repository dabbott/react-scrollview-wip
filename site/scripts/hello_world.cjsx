Link = require('react-router').Link
ScrollView = require '../../src/ScrollView'

# http://tools.medialab.sciences-po.fr/iwanthue/index.php
colors = [
  "EE78B2"
  "5BE487"
  "53CBE9"
  "6688F2"
  "F5464D"
  "DD51EC"
  "7C8DC0"
  "34F0E0"
  "DCA6E9"
  "F1487A"
  "AA72F1"
  "41AA70"
  "E66F70"
  "ED44C3"
  "F13B9A"
  "37B7A5"
  "DB70DD"
  "BD7CAB"
  "379FB1"
  "54A5D7"
  "54E1A2"
  "AA82E6"
  "A486CA"
  "7BA2E8"
  "3CDEE4"
  "49EDC4"
  "868CDF"
  "C27DC7"
  "DF66B8"
  "E0789B"
]

randomColor = ->
  return colors[Math.floor(Math.random() * colors.length)]

alternatingColor = do ->
  count = 0
  altColors = [
    "rgb(255,255,255)"
    "rgb(245,245,245)"
  ]
  return ->
    altColors[count++ % 2]

module.exports = React.createClass
  displayName: 'HelloWorld'

  render: ->
    verticalStyle =
      backgroundColor: 'rgba(0,0,255,0.2)'
      height: 400

    horizontalStyle =
      backgroundColor: 'rgba(0,0,255,0.2)'
      height: 200

    contentContainerStyle =
      lineHeight: 0

    horizontalImages = for i in [0...10]
      "http://placehold.it/160x160/#{randomColor()}/FFFFFF"

    verticalImages = for i in [0...10]
      "http://placehold.it/560x60/#{randomColor()}/FFFFFF"

    imageStyle =
      padding: 20

    <div>
      <h1>React ScrollView</h1>
      <h3>Vertical Scroll</h3>
      <br />
      <ScrollView style={verticalStyle}
        contentContainerStyle={contentContainerStyle}>
          {
            _.map verticalImages, (src) =>
              inlineStyle =
                backgroundColor: alternatingColor()
              <img src={src}
                style={_.extend inlineStyle, imageStyle}/>
          }
      </ScrollView>
      <h3>Horizontal Scroll</h3>
      <br />
      <ScrollView style={horizontalStyle}
        contentContainerStyle={contentContainerStyle}
        horizontal={true}>
          {
            _.map horizontalImages, (src) =>
              inlineStyle =
                backgroundColor: alternatingColor()
              <img src={src}
                style={_.extend inlineStyle, imageStyle}/>
          }
      </ScrollView>
    </div>
