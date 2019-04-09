RobotName = "NRMK-Indy7"
IPAddress = "192.168.10.108"
Port = 6066

global Connection;
Connection.robotName = RobotName;
Connection.sock = 0;
Connection.invokeID = 0;

IndyDCPConnect(IPAddress, Port)