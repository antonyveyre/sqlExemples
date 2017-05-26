    SELECT count(RefKitOuPiece) as Nb, Refoldpiece FROM tb_OldPiece as tb
    join tb_Pieces as tp on tp.refpiece = tb.refoldpiece
    group by refoldpiece having count(*) > 1