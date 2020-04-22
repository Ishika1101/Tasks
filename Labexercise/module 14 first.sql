---Xml document demo 1
declare @xmldata xml;
set @xmldata ='<orders>
	<order id="ord123457">
		<customer id="cust0067">
			<first-name>Shai</first-name>
			<last-name>Bassli</last-name>
			<address>
				<street>567 3rd Ave</street>
				<city>Saginaw</city>
				<state>MI</state>
				<zip>53900</zip>
			</address>
		</customer>
	</order>
</orders>';

select  @xmldata as XmlColumn;

---create schema collection demo 2
create xml schema collection BookSchemaCollection
as
N'<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
<xsd:element name="Book">
<xsd:complexType>
<xsd:sequence>
<xsd:element name="title" type="xsd:string"/>
<xsd:element name="author" type="xsd:string"/>
<xsd:element name="published" type="xsd:date"/>
<xsd:element name="version" type="xsd:decimal"/>
</xsd:sequence>
</xsd:complexType>
</xsd:element>
</xsd:schema>';

SELECT *  FROM sys.xml_schema_collections; 
SELECT *  FROM sys.xml_schema_namespaces; 


CREATE TABLE XmlUntypedata (
SessionID int PRIMARY KEY,
WindowSettings xml
);

CREATE TABLE XmlTypeData (
SessionID int PRIMARY KEY,
WindowSettings xml (BookSchemaCollection)
);

Insert into XmlUntypeData(SessionID,WindowSettings) values(1,'
<order id="ord123457">
		<customer id="cust0067">
			<first-name>Shai</first-name>
			<last-name>Bassli</last-name>
		</customer>
</order>');


Insert into XmlTypeData(SessionID,WindowSettings) values(2,'
<Book>
	<title>Titanic</title>
	<author>Ishika</author>
	<published>2002-09-24</published>
	<version>3.0</version>
	
</Book>
<Book>
	<title>Titanic</title>
	<author>Ishika</author>
	<published>2002-09-24</published>
	<version>3.0</version>
	
</Book>');

select * from XmlTypeData

---demo 3 xml Indexes

--Primary Index
CREATE PRIMARY XML INDEX PXmlIndex
ON XmlTypeData (WindowSettings);


--Secondary Index
CREATE  XML INDEX SXmlIndex_Path
ON XmlTypeData (WindowSettings)
using  xml Index PXmlIndex for path

--Show Indexes
select * from sys.xml_indexes

---Create Index on Table that has not Primary Key 

Create table ProEx(
Id int,
data xml
);

Create Primary xml Index PIndex on ProEx(data)--error must have Primary Key on table

----converting table to xml demo 4
use ProductDb

select * from dbo.products for xml auto;
select * from dbo.products for xml raw('Product');
select * from dbo.products for xml path;
select * from dbo.products for xml path('Product') ,root('Products');
select ProductId as [@ProductId] from dbo.products  for xml path('Product') ,root('Products');

use ProductDb
SELECT  ProductId AS '@ID',ProductQuantity,ProductPrice,
(SELECT ProductContent
FROM dbo.ProductDetails as ProductDetails
WHERE ProductDetails.ProductId = Products.ProductId
FOR XML AUTO, type, ELEMENTS)
FROM dbo.Products 
FOR XML PATH ('Product'), ROOT ('Products'), ELEMENTS;