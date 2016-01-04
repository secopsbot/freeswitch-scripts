  freeswitch.consoleLog("info", "chat console\n")
   
   local event = freeswitch.Event("CUSTOM", "SMS::SEND_MESSAGE");
   event:addHeader("proto", "sip");
   event:addHeader("dest_proto", "sip");
   event:addHeader("from", "sip:" .. message:getHeader("from") .. "@192.168.1.253");
   event:addHeader("from_full", "sip:" .. message:getHeader("from") .. "@192.168.1.253");
   event:addHeader("to", "1000@192.168.1.253");
   event:addHeader("subject", "sip:1000@192.168.1.253");
   event:addHeader("type", "text/html");
   event:addHeader("hint", "the hint");
   event:addHeader("replying", "true");
   event:addBody(message:getBody());
   -- freeswitch.consoleLog("info", event:serialize());
   event:fire();
