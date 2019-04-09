function ret = GetJointPosition()
  global Connection;
  Connection.invokeID = Connection.invokeID + 1;
    
  % Content
  contentLen = 0;

  % Prepare Packet
  buff = MakeHeader(Connection, 320, contentLen); 
  
  fwrite(Connection.sock, buff) ;
  
  % Get Feedback
  [ackID, data, len] = GetFeedback(Connection);
  
  if (len == 4)
    ret = typecast(uint8(data), 'uint32');
  else
    ret = typecast(uint8(data), 'double') * pi/180;
    ret = transpose(ret);
  end
end
