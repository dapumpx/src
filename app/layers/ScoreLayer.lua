local ScoreLayer = class("ScoreLayer", function(color, width, height) 
    -- return cc.LayerColor:create(color, width, height)
    return display.newColorLayer(color)
end)
--local ScoreLayer = class("ScoreLayer", cc.LayerColor)
--function ScoreLayer:create(dtype, text, callbackfunc) 
--    local layer = ScoreLayer.new() 
--    return layer 
--end

function ScoreLayer:ctor(color, width, height)
    self:createMsgBox()
    -- self:setColor(color)
    self:setContentSize(width, height)
    -- self:setAnchorPoint(0.5, 0.5)
    self:setPosition(display.cx - 100, display.cy - 50)   
    self.SystemEventManager = require("app.manager.SystemEventManager").new()

   self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        print("hhhhhhhhhhhhhhh")
    end)

    self:setTouchEnabled(true)
    self:setTouchSwallowEnabled(false)
end

function ScoreLayer:createMsgBox()
    local label = cc.ui.UILabel.new({
        UILabelType = cc.ui.UILabel.LABEL_TYPE_TTF,
        text = "REPLAY",
        font = "Verdana-Bold",
        size = 40,
        color = cc.c4f(0,0,0,100)
    })
    label:pos(self:getContentSize().width * 0.5, self:getContentSize().height * 0.5)
    label:setAnchorPoint(0.5, 0.5)
    
    self:addChild(label)
    -- label:setTouchEnabled(false)
    -- label:setTouchEnabled(true)
    -- label:addNodeEventListener(
    --     cc.NODE_TOUCH_EVENT, 
    --     handler(self, self.onTouchBtnClickHandler))
end

function ScoreLayer:onTouchBtnClickHandler(event)
    printf("sprite: %s x,y: %0.2f, %0.2f",
           event.name, event.x, event.y)
    self:removeFromParent()
end

return ScoreLayer