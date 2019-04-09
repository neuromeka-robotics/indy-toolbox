function IndyDCPConnect(ip_address, port)  
  global Connection
  Connection.sock = tcpip(ip_address, port);
  Connection.sock.OutputBufferSize = 1e9;
  fopen(Connection.sock);
  Connection.invokeID = 0;
end
