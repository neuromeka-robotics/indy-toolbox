function ret = SetDirectTeaching()
  global Connection;
  Connection.invokeID = Connection.invokeID + 1;
    
  % Content
  contentLen = 0;

  % Prepare Packet
  buff = MakeHeader(Connection, 80, contentLen);  
  
  fwrite(Connection.sock, buff);
  
  % Get Feedback
  [ackID, data, len] = GetFeedback(Connection);
  
  if (len < 4)
    ret = data;
  else
    ret = typecast(uint8(data), 'uint32');
  end
end