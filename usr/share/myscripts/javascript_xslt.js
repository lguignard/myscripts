// But code examples of javascript which execute a XSL tranformation
// with XML and XSL sheets

//<?xml version="1.0" encoding="ISO-8859-1"?>
//<catalog>
//  <cd>
//      <title>Empire Burlesque</title>
//      <artist>Bob Dylan</artist>
//      <country>USA</country>
//      <company>Columbia</company>
//      <price>10.90</price>
//      <year>1985</year>
//  </cd>
//</catalog>
  

// <?xml version="1.0" encoding="ISO-8859-1"?>
// <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
// <xsl:template match="/">
//   <html>
//     <body>
//       <h2>My CD Collection</h2>
//       <table border="1">
//       <tr bgcolor="#9acd32">
//         <th align="left">Title</th>
//         <th align="left">Artist</th>
//       </tr>
//       <xsl:for-each select="catalog/cd">
//         <tr>
//           <td><xsl:value-of select="title" /></td>
//           <td><xsl:value-of select="artist" /></td>
//         </tr>
//       </xsl:for-each>
//       </table>
//     </body>
//   </html>
// </xsl:template>
// </xsl:stylesheet>
  
<script type="text/javascript" lang="javascript">
function loadXMLDoc(dname)
{
  if (window.XMLHttpRequest)
      {
          xhttp=new XMLHttpRequest();
            }
  else
      {
          xhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
  xhttp.open("GET",dname,false);
  xhttp.send("");
  return xhttp.responseXML;
}

function displayResult()
{
  xml=loadXMLDoc("cdcatalog.xml");
  xsl=loadXMLDoc("cdcatalog.xsl");
  // code for IE
  if (window.ActiveXObject)
      {
          ex=xml.transformNode(xsl);
            document.getElementById("example").innerHTML=ex;
              }
  // code for Mozilla, Firefox, Opera, etc.
  else if (document.implementation && document.implementation.createDocument)
      {
          xsltProcessor=new XSLTProcessor();
            xsltProcessor.importStylesheet(xsl);
              resultDocument = xsltProcessor.transformToFragment(xml,document);
                document.getElementById("example").appendChild(resultDocument);
                  }
}
</script>







//
// Fichier HTML, départ de tout
//
<html>
<head>
  <script type="text/javascript">
    var processor;
    var xslt;
    var xmlDoc;

    function tri(field,order) {
      processor.setParameter(null,"field", field);
      processor.setParameter(null,"order", order);
      var resultat = processor.transformToFragment(xmlDoc,document);
      document.body.innerHTML = ""
      document.body.appendChild(resultat);
    }

    function tri_init(field,order) {
      xslt= document.implementation.createDocument("", "", null);
      xslt.async=false;
      xslt.load("test-xslt.xml");
      processor =new XSLTProcessor();
      processor.importStylesheet(xslt);
      xmlDoc= document.implementation.createDocument("", "", null);
      xmlDoc.async=false;
      xmlDoc.load("test.xml");
      tri(field,order);
    }
  </script>
</head>
<body>
  <script type="text/javascript">
    tri_init('name', 'ascending');
  </script>
</body>
</html>

//--------------------------------------
// FEUILLE DE STYLE XSLT :test-xslt.xml
//--------------------------------------
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
<xsl:param name="field"/>
<xsl:param name="order"/>
<xsl:template match="persons">
  <table>
    <xsl:variable name="neworder">
      <xsl:if test="$order='ascending'">descending</xsl:if>
      <xsl:if test="$order='descending'">ascending</xsl:if>
    </xsl:variable>

    <tr><th><a href="javascript:tri('name','{$neworder}')">name</a></th><th><a href="javascript:tri('phone','{$neworder}')">phone number</a></th></tr>
    <xsl:for-each select="person">
      <xsl:sort select="*[name()=$field]" order="{$order}"/>
      <tr><td><xsl:value-of select="name"/></td><td><xsl:value-of select="phone"/></td></tr>
    </xsl:for-each>
  </table>
</xsl:template>
</xsl:stylesheet>

//-----------------------
// FEUILLE XML: test.xml
//-----------------------
<?xml version="1.0" encoding="UTF-8"?>
<persons>
  <person>
    <name> toto </name>
    <phone> 1122334455 </phone>
  </person>
  <person>
    <name> titi </name>
    <phone> 3344556677 </phone>
  </person>
  <person>
    <name> tata </name>
    <phone> 2233445566 </phone>
  </person>
</persons> 
