/* Verification de label, code , partReplace pour Chappee */

select distinct ir.FromItemId, ir.ToItemId, i.Code as CodeItemFrom, il.Label as LabelFrom, 
(
select i.code 
from doc.Item as i
join doc.ItemReplace as ir2 on i.ItemId = ir2.ToItemId
where i.ItemId = ir.ToItemId
) as CodeItemTo,
(
select ili.Label 
from doc.Itemlocalization as ili 
where ili.ItemId = ir.ToItemId
) as LabelTo

from doc.Item as i
join doc.Itemlocalization as il on il.ItemId = i.ItemId
join doc.ItemReplace as ir on ir.FromItemId = i.ItemId
where i.Code in ('721332400' ,'7115407','7115704','sx5686680','S17261132')
