function init()
  if storage.state == nil then
    output(false)
  else
    object.setAllOutputNodes(storage.state)
  end
  local updated = false
  self.gateoutputs = storage.gateoutputs or config.getParameter("gatetype")
  self.outputvalue = storage.outputvalue or math.random(0,(gateoutputs-1))
end

function output(state)
  if storage.state ~= state then
    storage.state = state
    object.setAllOutputNodes(state)
  end
end

function update(dt)
  if object.getInputNodeLevel(1)==true then
    self.outputvalue = math.random(0,(self.gateoutputs-1))
    object.setAllOutputNodes(false)
  end
  if object.getInputNodeLevel(0)==false and object.isInputNodeConnected(0) then
    object.setAllOutputNodes(false)
  else
    object.setOutputNodeLevel(self.outputvalue, true)
  end
end

function uninit()
  storage.gateoutputs = self.gateoutputs
  storage.outputvalue = self.outputvalue
end
