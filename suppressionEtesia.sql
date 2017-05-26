use DocumatEtesia
go


begin transaction


 
           

             delete 
             from ord.ItemAvailability 
             where Itemid in (
                    select ItemId 
                    from dbo.item
                    where ItemReference in (
                                 select code 
                                 from doc.item 
                                 where code2 is not null
                                 )
                    )


              update b
                              set B.ItemId = i2.ItemId
                              from ord.BasketDetail as b
                              join dbo.Item as i on b.ItemId = i.ItemId
                              join doc.Item as di on di.Code = i.ItemReference
                              join doc.Item as di2 on di2.Code = di.Code2
                              join dbo.item as i2 on i2.ItemReference = di2.Code

                              where i.Itemid in (
                                            select ItemId 
                                            from dbo.item
                                            where ItemReference in (
                                                                          select code 
                                                                          from doc.item 
                                                                          where code2 is not null
                                                                          )
                                            )

             delete 
             from ord.ItemPrice
             where Itemid in (
                    select ItemId 
                    from dbo.item
                    where ItemReference in (
                                 select code 
                                 from doc.item 
                                 where code2 is not null
                                 )
                    )


             delete
             from dbo.item
             where ItemReference in (
                    select code 
                    from doc.item 
                    where code2 is not null
                    )

             delete 
             from doc.Itemlocalization 
             where ItemId in (
                    select i.ItemId 
                    from doc.Item as i 
                    join doc.Itemlocalization as il on i.ItemId = il.ItemId
                    where i.code2 is not null
                    )

             delete 
             from doc.ItemReplace 
             where ToItemId in (
                    select i.ItemId 
                    from doc.Item as i 
                    where i.code2 is not null
                    )
             or FromItemId in (
                    select i.ItemId 
                    from doc.Item as i
                    where i.code2 is not null
                    )


             delete 
             from doc.ItemPartList 
             where ItemId in (
                    select i.ItemId 
                    from doc.Item as i 
                    where i.code2 is not null
                    )


             delete 
             from doc.ItemUsedBy 
             where ItemId in (
                    select i.ItemId 
                    from doc.Item as i 
                    where i.code2 is not null
                    )


		
			DECLARE @tempTable TABLE(
			[ItemId]int)
			 insert into @tempTable
			  select i.ItemId 
                    from doc.Item as i 
                    where i.code2 is not null

             delete 
             from doc.Item
             where code2 is not null



			 delete 
             from ref.ItemRef where ItemId in (
                    select * 
                    from @tempTable
                    )



  
use HorizonEtesia
go


             

             delete 
             from doc.Itemlocalization 
             where ItemId in (
                    select i.ItemId 
                    from doc.Item as i 
                    join doc.Itemlocalization as il on i.ItemId = il.ItemId
                    where i.code2 is not null
                    )

             delete 
             from doc.ItemReplace 
             where ToItemId in (
                    select i.ItemId 
                    from doc.Item as i 
                    where i.code2 is not null
                    )
             or FromItemId in (
                    select i.ItemId 
                    from doc.Item as i
                    where i.code2 is not null
                    )


             delete 
             from doc.ItemPartList 
             where ItemId in (
                    select i.ItemId 
                    from doc.Item as i 
                    where i.code2 is not null
                    )


             delete 
             from doc.ItemUsedBy 
             where ItemId in (
                    select i.ItemId 
                    from doc.Item as i 
                    where i.code2 is not null
                    )


			DECLARE @tempTable TABLE(
			[ItemId]int)
			 insert into @tempTable
			  select i.ItemId 
                    from doc.Item as i 
                    where i.code2 is not null

             delete 
             from doc.Item
             where code2 is not null



			 delete 
             from ref.ItemRef where ItemId in (
                    select * 
                    from @tempTable
                    )

             rollback 
