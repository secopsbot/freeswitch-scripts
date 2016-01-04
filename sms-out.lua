  freeswitch.consoleLog("info", "chat console\n")
  freeswitch.consoleLog("info", message:getHeader("to") .. "\n")   

   local out_num = message:getHeader("to"):sub(1,13)
   freeswitch.consoleLog("info", out_num .. "\n")

   local event = freeswitch.Event("CUSTOM", "SMS::SEND_MESSAGE");
   event:addHeader("proto", "sip");
   event:addHeader("dest_proto", "sms");
   event:addHeader("from", "sip:" .. message:getHeader("from") .. "@192.168.1.253");
   event:addHeader("from_full", "sip:" .. message:getHeader("from") .. "@192.168.1.253");
   event:addHeader("to", out_num);
   event:addHeader("subject", out_num);
   event:addHeader("type", "text/html");
   event:addHeader("hint", "gsm01");
   event:addHeader("replying", "true");
   event:addBody(message:getBody());
   -- freeswitch.consoleLog("info", event:serialize());
   event:fire();
