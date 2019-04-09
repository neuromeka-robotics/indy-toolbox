function ret = MoveJointBy(target)
  global Connection;
  Connection.invokeID = Connection.invokeID + 1;
    
  % Content
  content = typecast(double(target), 'uint8');
  contentLen = length(content);
  
  % Prepare Packet
  buff = MakeHeader(Connection, 10, contentLen);
  buff(end+1:end+contentLen) = content;

  fwrite(Connection.sock, buff);

  % Get Feedback
  [ackID, data, len] = GetFeedback(Connection);
  
  if (len < 4)
    ret = data;
  else
    ret = typecast(uint8(data), 'uint32');
  end
end