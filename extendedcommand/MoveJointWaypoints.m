function ret = MoveJointWaypoints(waypoints)
  global Connection;
  Connection.invokeID = Connection.invokeID + 1;

  num_points = size(waypoints);
  num_points = num_points(1)
    
  % Extended Content
  exbuff = [];
  waypoints = waypoints * 180 / pi;
  for i = 1:num_points
      posBuff = typecast(waypoints(i,:), 'uint8');
      exbuff(end+1 : end+length(posBuff)) = posBuff;
  end

  % Content
  extendedCmdID = uint32(11);
  extendedDataLen = uint32(length(exbuff));
  content = typecast(extendedCmdID, 'uint8');
  content(end+1:end+4) = typecast(extendedDataLen, 'uint8');
  contentLen = length(content);

  % Prepare Packet
  buff = MakeHeader(Connection, 800, contentLen);
  buff(end+1:end+contentLen) = content;

  % Send DCP Packet
  fwrite(Connection.sock, buff);
  fwrite(Connection.sock, exbuff);
  
  [ackID, data, len] = GetFeedback(Connection);
  ret = typecast(uint8(data), 'uint32');
end