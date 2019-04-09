function IndyDCPClose(conn)
  fclose(conn.sock);
  delete(conn.sock);
end
