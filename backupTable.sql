bcp [databaseName].[Schema].[TableName] out c:\Temp\TableName.bcp  -S localhost -T -n


/*
Dans cet exemple nous sauvegardons la table [databaseName].[Schema].[TableName] dans le fichier c:\Temp\TableName.bcp.

    L’option out indique qu’il s’agit d’une sauvegarde.
    L’option –S permet de spécifier le serveur de bases de données.
    L’option –T permet d’utiliser le mode authentification Windows. Si vous désirez utiliser un login/mot de passe avec de l’authentification SQL il faut utiliser à la place –U login –P password.
    L’option –n permet d’effectuer une copie en bloc en faisant appel aux types de données stockés dans la table. Si cette option n’est pas indiquée, une invite de commande vous demandera le type des différents champs. Un autre mode est –c qui permet de stocker les données au format caractère (char), ayant déjà eu des problèmes avec cette option je préfère utiliser -n.

Comment importer un fichier dans une table ?
*/


/*	
bcp [databaseName2].[Schema].[TableName] in c:\Temp\TableName.bcp -S localhost -T –n

dans cet exemple nous restaurons le fichier c:\Temp\TableName.bcp dans la table [databaseName2].[Schema].[TableName] (Cette table doit exister et avoir le bon schéma).

L’option in indique qu’il s’agit d’un import. Les options –S, –T et –n ont les mêmes fonctions que précédemment.

Attention, ce n’est pas une restauration puisqu’il ajoute les données et ne les remplace pas.

Comment sauvegarder une partie d’une table dans un fichier ?
1
	
bcp "SELECT * FROM [databaseName].[Schema].[TableName] where CREATIONDATE > '2011-01-01'" queryout c:\Temp\TableName2.bcp  -S localhost -T -n

Dans cet exemple nous avons utilisé un requête SQL pour sélectionner une partie des données (date de création supérieur au premier janvier 2011) dans le fichier c:\Temp\TableName2.bcp.

Notez qu’à la place de out nous avons utilisé queryout pour lui indiquer que nous faisons une sauvegarde à partir d’une requête SQL.

D’autres options existent comme par exemple la version de SQL Server, l’export au format XML ou la gestion des champs identité. Je vous conseille de lire l’article msdn correspondant pour plus d’informations : http://msdn.microsoft.com/fr-fr/library/ms162802.aspx
*/