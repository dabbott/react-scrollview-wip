React = require 'react'
_ = require 'lodash'
# ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

module.exports = class ScrollView extends React.Component

    @defaultProps =
        className: ''
        style: {}
        contentContainerStyle: {}
        horizontal: false
        keyboardDismissMode: 'none'
        onScroll: ->
        removeClippedSubviews: false
        showsHorizontalScrollIndicator: false
        showsVerticalScrollIndicator: false

    @propTypes = {}

    constructor: (props) ->
        super props

    render: ->
        <div>
            Test
        </div>

### Native Props

contentContainerStyle
horizontal
keyboardDismissMode
onScroll
removeClippedSubviews
showsHorizontalScrollIndicator
showsVerticalScrollIndicator

ios
    alwaysBounceHorizontal
    alwaysBounceVertical
    automaticallyAdjustContentInsets
    bounces
    bouncesZoom
    canCancelContentTouches
    centerContent
    contentInset
    contentOffset
    decelerationRate
    directionalLockEnabled
    keyboardShouldPersistTaps
    maximumZoomScale
    minimumZoomScale
    onScrollAnimationEnd
    pagingEnabled
    scrollEnabled
    scrollEventThrottle
    scrollIndicatorInsets
    scrollsToTop
    stickyHeaderIndices
    zoomScale

style
    flexbox
    transforms
    backfaceVisibility
    backgroundColor
    borderColor
    borderTopColor
    borderRightColor
    borderBottomColor
    borderLeftColor
    borderRadius
    borderTopLeftRadius
    borderTopRightRadius
    borderBottomLeftRadius
    borderBottomRightRadius
    borderStyle
    opacity
    overflow
    shadowColor
    shadowOffset
    shadowOpacity
    shadowRadius

###
