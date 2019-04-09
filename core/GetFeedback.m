function [ack_id, data, len] = GetFeedback(conn)
  
  header = fread(conn.sock, 52);
  len = typecast(uint8(header(39:42)), 'uint32');
  
  ack_id = fread(conn.sock, 4);
  ack_id = typecast(uint8(ack_id), 'uint32');
  
  data = 0;
  if (len > 0)
    data = fread(conn.sock, double(len));
  end
end