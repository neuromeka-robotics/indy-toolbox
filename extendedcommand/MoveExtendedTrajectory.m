function ret = MoveExtendedTrajectory(delt, position, velocity, acceleration)
  global Connection;
  Connection.invokeID = Connection.invokeID + 1;

  pos_size = size(position);
    
  % Extended Content
  trajType = typecast(uint32(1), 'uint8');
  freq = typecast(uint32(1 / delt), 'uint8');
  datasetNum = typecast(uint32(3), 'uint8');
  datasetSize = typecast(uint32(pos_size(2)), 'uint8');
  trajLen = typecast(uint32(pos_size(1)), 'uint8');

  exbuff = [];
  exbuff(end+1 : end+length(trajType)) = trajType;
  exbuff(end+1 : end+length(freq)) = freq;
  exbuff(end+1 : end+length(datasetNum)) = datasetNum;
  exbuff(end+1 : end+length(datasetSize)) = datasetSize;
  exbuff(end+1 : end+length(trajLen)) = trajLen;
  for i = 1:pos_size(1)
      posBuff = typecast(position(i,:), 'uint8');
      velBuff = typecast(velocity(i,:), 'uint8');
      accBuff = typecast(acceleration(i,:), 'uint8');
      exbuff(end+1 : end+length(posBuff)) = posBuff;
      exbuff(end+1 : end+length(velBuff)) = velBuff;
      exbuff(end+1 : end+length(accBuff)) = accBuff;
  end

  % Content
  extendedCmdID = uint32(1);
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