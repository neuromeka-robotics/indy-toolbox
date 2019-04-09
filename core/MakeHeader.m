function header = MakeHeader(conn, cmd_id, cmd_len)
  % Prepare Header
  header = zeros(1, 56, 'uint8');
  headerIdx = 0;
  
  % Robot Name
  robot_name = unicode2native(conn.robotName);
  header(headerIdx+1 : headerIdx + length(robot_name)) = robot_name;
  headerIdx = headerIdx + 20;
  
  % Robot Version
  robot_version = uint8(0);
  header(headerIdx+1 : headerIdx + length(robot_version)) = robot_version;
  headerIdx = headerIdx + 12;
  
  % STEP Info
  step_info = uint8(hex2dec('02'));
  header(headerIdx+1 : headerIdx + length(step_info)) = step_info;
  headerIdx = headerIdx + 1;
  
  % SoF
  sof = uint8(hex2dec('34'));
  header(headerIdx+1 : headerIdx + length(sof)) = typecast(sof, 'uint8');
  headerIdx = headerIdx + 1;
  
  % Invoke ID
  invokeID = typecast(uint32(conn.invokeID), 'uint8');
  header(headerIdx+1 : headerIdx + length(invokeID)) = invokeID;
  headerIdx = headerIdx + 4;
  
  % Command Length
  cmdLen = typecast(uint32(cmd_len), 'uint8');
  header(headerIdx+1 : headerIdx + length(cmdLen)) = cmdLen;
  headerIdx = headerIdx + 4;
  
  % Reserved
  headerIdx = headerIdx + 10; 
  
  % Command ID
  cmdID = typecast(uint32(cmd_id), 'uint8');
  header(headerIdx+1 : headerIdx + length(cmdID)) = cmdID;
  headerIdx = headerIdx + 4;
end
