'
' First script
Const ADS_SCOPE_SUBTREE = 2
Set objConnection = CreateObject("ADODB.Connection")
Set objCommand = CreateObject("ADODB.Command")
objConnection.Provider = "ADsDSOObject"
objConnection.Open "Active Directory Provider"
Set objCommand.ActiveConnection = objConnection
objCommand.Properties("Page Size") = 1000
objCommand.Properties("Searchscope") = ADS_SCOPE_SUBTREE

WScript.Echo "Executing LDAP query.."
objCommand.CommandText = "SELECT * FROM 'LDAP://server/o=org' WHERE objectClass='dominoPerson' AND mail='*'"
Set objRecordSet = objCommand.Execute
WScript.Echo "Query complete. Found " & objRecordSet.RecordCount & " objects."

objRecordSet.MoveFirst
Do Until objRecordSet.EOF
Set objUser = GetObject(objRecordSet.Fields("ADsPath").Value)
WScript.Echo objUser.mail
objRecordSet.MoveNext
Loop



'
' Second Script
Dim conn As ADODB.Connection
Dim rs As ADODB.Recordset

Set conn = New ADODB.Connection
conn.Provider = "ADSDSOObject"
conn.Open "ADs Provider"

Set rs = conn.Execute("<LDAP://server/o=organization/o=xxxxxx University/c=US>;" 
                     & "(objectClass=*);ADsPath,objectClass,cn;subtree")

While Not rs.EOF
  Debug.Print rs.Fields(0).Value, rs.Fields(1).Value, rs.Fields(2).Value rs.MoveNext 
Wend 

conn.Close
