React = require 'react'
require './css/main.styl'

MotionDemoComponent = React.createClass
  getInitialState:-> @state = {}
  render:->
    playClass = if @state.isDemoLaunched then 'is-play' else ''
    <div className="motion-demo #{playClass}">
      <div className="motion-demo__header">Quick demo:</div>
      <div className="motion-demo__ghost"></div>
      <div className="motion-demo__play" onClick=@launchDemo></div>
      <div  className="motion"
            dangerouslySetInnerHTML={{__html: @state.html }}>
      </div>
    </div>

  componentDidMount:->
    it = @
    require [ './motion-demo.html', './js/main'],
      (MotionDemoHtml, MotionDemo)->
        it.setState
          html: MotionDemoHtml
          demo: new MotionDemo
        it.state.demo.init()

  launchDemo:->
    @state.demo.run()
    @setState isDemoLaunched: true


module.exports = MotionDemoComponent